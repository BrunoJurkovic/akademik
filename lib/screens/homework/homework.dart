import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeworkScreen extends StatefulWidget {
  @override
  _HomeworkScreenState createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            child:
                IconButton(icon: Icon(CupertinoIcons.back), onPressed: () {}),
            padding: EdgeInsets.only(right: width * 0.03),
          ),
        ],
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
        title: Transform(
          transform: Matrix4.translationValues(-(width * 0.15), 0.0, 0.0),
          child: Text(
            'Homework',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: height * 0.025,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        // leading: IconButton(
        //   icon: Icon(
        //     FontAwesomeIcons.bars,
        //   ),
        //   onPressed: () {
        //     ExtendedNavigator.of(context).push('/menu-screen');
        //   },
        // ),
      ),
    );
  }
}
