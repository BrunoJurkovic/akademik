import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeworkDetailsScreen extends StatefulWidget {
  @override
  _HomeworkDetailsScreenState createState() => _HomeworkDetailsScreenState();
}

class _HomeworkDetailsScreenState extends State<HomeworkDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
          title: Text(
            'Homework',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: height * 0.025,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          )),
    );
  }
}
