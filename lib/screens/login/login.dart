import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.space,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
              width: width * 1,
              height: height * 0.35,
              child: Image.asset(
                'assets/images/login.png',
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.03, width * 0.10, 0, 0),
            child: Text(
              'Login',
              style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                  fontSize: height * 0.045),
            ),
          ),
        ],
      ),
    );
  }
}
