import 'package:akademik/services/user_repo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.075),
        child: AppBar(
          actions: [
            Padding(
              child: IconButton(
                  icon: Icon(CupertinoIcons.back),
                  onPressed: () {
                    ExtendedNavigator.of(context).pop();
                  }),
              padding: EdgeInsets.only(right: width * 0.03),
            ),
          ],
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
          title: Transform(
            transform: Matrix4.translationValues(-(width * 0.13), 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bruno Jurković',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.025,
                  ),
                ),
                Text(
                  '3.C Razred',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.02,
                  ),
                ),
              ],
            ),
          ),
          leading: Row(
            children: [
              Padding(
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    Provider.of<UserRepository>(context).currentUser.pictureUrl,
                  ),
                ),
                padding: EdgeInsets.only(left: width * 0.035),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 35,
              ),
              children: [
                AkademikGridItem(
                  text: 'Dashboard',
                  callback: () {
                    ExtendedNavigator.of(context).pop();
                  },
                  iconPath: 'assets/images/house.png',
                ),
                AkademikGridItem(
                    text: 'Homework',
                    callback: () {
                      ExtendedNavigator.of(context).push('/homework-screen');
                    },
                    iconPath: 'assets/images/homework_icon.png'),
                AkademikGridItem(
                  text: 'Attendance',
                  callback: () {
                    ExtendedNavigator.of(context).push('/attendance-screen');
                  },
                  iconPath: 'assets/images/note.png',
                ),
                AkademikGridItem(
                  text: 'Exams',
                  callback: () {
                    ExtendedNavigator.of(context).push('/exams-screen');
                  },
                  iconPath: 'assets/images/exam.png',
                ),
                AkademikGridItem(
                  text: 'News',
                  callback: () {
                    ExtendedNavigator.of(context).push('/news-screen');
                  },
                  iconPath: 'assets/images/newspaper.png',
                ),
                AkademikGridItem(
                  text: 'Grades',
                  callback: () {
                    ExtendedNavigator.of(context).push('/grades-screen');
                  },
                  iconPath: 'assets/images/test.png',
                ),
                AkademikGridItem(
                  text: 'Notes',
                  callback: () {
                    ExtendedNavigator.of(context).push('/notes-list-screen');
                  },
                  iconPath: 'assets/images/notes.png',
                ),
                AkademikGridItem(
                  text: 'Profile',
                  callback: () {
                    ExtendedNavigator.of(context).push('/profile-screen');
                  },
                  iconPath: 'assets/images/user.png',
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  await Provider.of<UserRepository>(context, listen: false)
                      .logOutUser();
                  await ExtendedNavigator.of(context)
                      .popUntil(ModalRoute.withName('/auth-screen'));
                  await ExtendedNavigator.of(context).push('/auth-screen');
                },
                child: Container(
                  height: height * 0.05,
                  width: width * 0.3,
                  alignment: Alignment.center,
                  child: Text(
                    'Logout',
                    style: GoogleFonts.montserrat(
                      color: Colors.redAccent,
                      wordSpacing: 5,
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.022,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AkademikGridItem extends StatelessWidget {
  const AkademikGridItem({Key key, this.text, this.callback, this.iconPath})
      : super(key: key);

  final String text;
  final Function callback;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              callback();
            },
            child: Container(
                width: width * 0.2,
                height: height * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.9),
                ),
                child: Container(
                  width: width * 0.1,
                  height: height * 0.1,
                  child: Image.asset(
                    iconPath ?? 'assets/images/bookmarkC.png',
                    fit: BoxFit.scaleDown,
                  ),
                )),
          ),
        ),
        Text(
          text,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: height * 0.022,
          ),
        ),
      ],
    );
  }
}
