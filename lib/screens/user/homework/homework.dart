import 'package:akademik/components/homework_list.dart';
import 'package:akademik/components/title_widget.dart';
import 'package:akademik/providers/homework.dart';
import 'package:akademik/services/homework_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeworkScreen extends StatefulWidget {
  @override
  _HomeworkScreenState createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
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
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, height * 0.025, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              todaysHomework.isEmpty
                  ? Container()
                  : TitleWidget(text: 'Due today'),
              todaysHomework.isEmpty
                  ? Container()
                  : Container(
                      width: width * 0.9,
                      height: height * 0.20,
                      padding: EdgeInsets.only(top: 25),
                      child: HomeworkList(
                          homeworkList: todaysHomework,
                          width: width,
                          height: height),
                    ),
              todaysHomework.isEmpty
                  ? Container()
                  : SizedBox(
                      height: 25,
                    ),
              tomorrowsHomework.isEmpty
                  ? Container()
                  : TitleWidget(text: 'Due tomorrow'),
              tomorrowsHomework.isEmpty
                  ? Container()
                  : Container(
                      width: width * 0.9,
                      height: height * 0.20,
                      padding: EdgeInsets.only(top: 25),
                      child: HomeworkList(
                          homeworkList: tomorrowsHomework,
                          width: width,
                          height: height),
                    ),
              tomorrowsHomework.isEmpty
                  ? Container()
                  : SizedBox(
                      height: 25,
                    ),
              allHomework.isEmpty
                  ? Container()
                  : TitleWidget(text: 'Due later'),
              allHomework.isEmpty
                  ? Container()
                  : Container(
                      width: width * 0.9,
                      height: height * 0.20,
                      padding: EdgeInsets.only(top: 25),
                      child: HomeworkList(
                          homeworkList: allHomework,
                          width: width,
                          height: height),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
