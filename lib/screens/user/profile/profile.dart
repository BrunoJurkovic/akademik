import 'package:akademik/providers/user.dart';
import 'package:akademik/services/user_repo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final user = Provider.of<UserRepository>(context).currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
        elevation: 0,
        title: Text(
          'Profile',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: height * 0.025,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.3,
            width: width,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.withOpacity(0.85),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(user.pictureUrl),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
            width: width * 0.9,
            height: height * 0.5,
            child: ListView(
              children: [
                ProfileItem(
                  width: width,
                  height: height,
                  item: 'Name',
                  text: user.name,
                ),
                Divider(color: Colors.black26),
                ProfileItem(
                  width: width,
                  height: height,
                  item: 'Student ID',
                  text: user.userId,
                ),
                Divider(color: Colors.black26),
                ProfileItem(
                  width: width,
                  height: height,
                  item: 'E-Mail',
                  text: user.email,
                ),
                Divider(color: Colors.black26),
                ProfileItem(
                  width: width,
                  height: height,
                  item: 'Year',
                  text: '${user.year}th grade',
                ),
                Divider(color: Colors.black26),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.text,
      @required this.item})
      : super(key: key);

  final double width;
  final double height;
  final String item;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.9,
      height: height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: height * 0.0275,
            ),
          ),
          Text(
            text,
            style: GoogleFonts.montserrat(
              color: Colors.deepPurpleAccent.withOpacity(0.9),
              fontWeight: FontWeight.w500,
              fontSize: height * 0.02,
            ),
          ),
        ],
      ),
    );
  }
}
