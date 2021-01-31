import 'package:akademik/providers/homework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeworkList extends StatelessWidget {
  const HomeworkList({
    Key key,
    @required this.homeworkList,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final List<AkademikHomework> homeworkList;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: homeworkList.length,
      itemBuilder: (BuildContext context, int index) {
        print(homeworkList);
        return Column(
          children: [
            Container(
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
