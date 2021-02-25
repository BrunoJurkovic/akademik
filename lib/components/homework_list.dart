import 'package:akademik/providers/homework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeworkList extends StatelessWidget {
  const HomeworkList({
    Key key,
    @required this.homeworkList,
    @required this.width,
    @required this.height,
    this.isTeacherMode = false,
  }) : super(key: key);

  final List<AkademikHomework> homeworkList;
  final double width;
  final double height;
  final bool isTeacherMode;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: homeworkList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            !isTeacherMode
                ? TeacherHomeworkItem(
                    width: width,
                    height: height,
                    homeworkList: homeworkList,
                    index: index)
                : StudentHomeworkItem(
                    width: width,
                    height: height,
                    homeworkList: homeworkList,
                    index: index,
                  ),
            SizedBox(
              height: height * 0.010,
            ),
          ],
        );
      },
    );
  }
}

class StudentHomeworkItem extends StatelessWidget {
  const StudentHomeworkItem({
    Key key,
    @required this.width,
    @required this.height,
    @required this.homeworkList,
    @required this.index,
  }) : super(key: key);

  final double width;
  final double height;
  final List<AkademikHomework> homeworkList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.9,
      height: height * 0.075,
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.3),
      ),
      child: Row(
        children: [
          Checkbox(
            activeColor: Colors.deepPurpleAccent.withOpacity(
              0.9,
            ),
            value: homeworkList[index].isFinished,
            onChanged: (check) {
              //
            },
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 15, 0, 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  homeworkList[index].assignment,
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.015,
                  ),
                ),
                SizedBox(
                  height: height * 0.0075,
                ),
                Text(
                  homeworkList[index].aclass,
                  style: GoogleFonts.montserrat(
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.013,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TeacherHomeworkItem extends StatelessWidget {
  const TeacherHomeworkItem({
    Key key,
    @required this.width,
    @required this.height,
    @required this.homeworkList,
    @required this.index,
  }) : super(key: key);

  final double width;
  final double height;
  final List<AkademikHomework> homeworkList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.9,
      height: height * 0.075,
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.3),
      ),
      child: Row(
        children: [
          Icon(CupertinoIcons.book_solid),
          Container(
            padding: EdgeInsets.fromLTRB(20, 15, 0, 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  homeworkList[index].assignment,
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.018,
                  ),
                ),
                SizedBox(
                  height: height * 0.0075,
                ),
                Text(
                  homeworkList[index].aclass,
                  style: GoogleFonts.montserrat(
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.015,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
