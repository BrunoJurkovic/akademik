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
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: width * 0.6,
              height: height * 0.6,
              child: Image.asset('assets/images/login.png'),
            ),
          ),
          Text(
            'Login',
            style: GoogleFonts.montserrat(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    ));
  }
}
