import 'package:akademik/components/homework_list.dart';
import 'package:akademik/components/title_widget.dart';
import 'package:akademik/providers/homework.dart';
import 'package:akademik/routes/akademik_router.gr.dart';
import 'package:akademik/services/homework_repo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AdminHomeworkScreen extends StatefulWidget {
  @override
  _AdminHomeworkScreenState createState() => _AdminHomeworkScreenState();
}

class _AdminHomeworkScreenState extends State<AdminHomeworkScreen> {
  List<AkademikHomework> allHomework = [];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    allHomework =
        Provider.of<HomeworkRepository>(context, listen: true).getOtherHomework;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.add),
              onPressed: () {
                ExtendedNavigator.root.push(
                  Routes.homeworkDetailsScreen,
                  arguments: HomeworkDetailsScreenArguments(
                    homework: AkademikHomework(
                      aclass: '',
                      assignment: '',
                      description: '',
                      isFinished: false,
                      timeAssigned: DateTime.now(),
                      timeDue: DateTime.now(),
                      userId: Uuid().v4(),
                    ),
                  ),
                );
              })
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
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, height * 0.025, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TitleWidget(text: 'All Homework'),
            Container(
              width: width * 0.9,
              height: height * 0.20,
              padding: EdgeInsets.only(top: 25),
              child: HomeworkList(
                homeworkList: allHomework,
                width: width,
                height: height,
                isTeacherMode: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
