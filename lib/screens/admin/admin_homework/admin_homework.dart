import 'package:akademik/providers/homework.dart';
import 'package:akademik/services/homework_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminHomeworkScreen extends StatefulWidget {
  @override
  _AdminHomeworkScreenState createState() => _AdminHomeworkScreenState();
}

class _AdminHomeworkScreenState extends State<AdminHomeworkScreen> {
  List<AkademikHomework> todaysHomework = [];
  List<AkademikHomework> tomorrowsHomework = [];
  List<AkademikHomework> allHomework = [];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    todaysHomework =
        Provider.of<HomeworkRepository>(context, listen: true).getTodayHomework;
    tomorrowsHomework = Provider.of<HomeworkRepository>(context, listen: true)
        .getTomorrowHomework;
    allHomework =
        Provider.of<HomeworkRepository>(context, listen: true).getOtherHomework;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
          actions: [
            IconButton(icon: Icon(CupertinoIcons.add), onPressed: () {})
          ],
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
