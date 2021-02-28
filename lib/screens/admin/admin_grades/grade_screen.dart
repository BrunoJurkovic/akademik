import 'package:akademik/providers/grades.dart';
import 'package:akademik/services/grades_repo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminGradesScreen extends StatefulWidget {
  const AdminGradesScreen({Key key, this.subject}) : super(key: key);

  @override
  _AdminGradesScreenState createState() => _AdminGradesScreenState();
  final String subject;
}

class _AdminGradesScreenState extends State<AdminGradesScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final grades = Provider.of<GradeRepository>(context, listen: true)
        .getGradesBySubject(widget.subject);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
        title: Text(
          'Grades',
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
        ),
      ),
    );
  }
}
