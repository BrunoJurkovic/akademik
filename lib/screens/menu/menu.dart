import 'package:akademik/services/user_repo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koukicons/notebook.dart';
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
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(20),
          //     bottomRight: Radius.circular(20),
          //   ),
          // ),
          leading: Row(
            children: [
              Padding(
                child: CircleAvatar(),
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
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 35,
              ),
              itemCount: 11,
              itemBuilder: (ctx, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print(index);
                        },
                        child: Container(
                            width: width * 0.2,
                            height: height * 0.2,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.9),
                            ),
                            child: Image.asset('assets/images/bookmarkC.png')),
                      ),
                    ),
                    Text(
                      'Reports',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: height * 0.022,
                      ),
                    ),
                  ],
                );
              },
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
