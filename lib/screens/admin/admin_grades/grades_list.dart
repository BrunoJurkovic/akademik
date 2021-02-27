import 'package:akademik/components/title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminGradesList extends StatefulWidget {
  @override
  _AdminGradesListState createState() => _AdminGradesListState();
}

class _AdminGradesListState extends State<AdminGradesList> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
        title: Text(
          'Exams',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
            child: TitleWidget(text: 'Subjects'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
            child: Container(
              width: width * 0.95,
              height: height * 0.8,
              child: ListView(
                children: [
                  GradeListItem(
                    width: width,
                    height: height,
                    gradeName: 'English',
                  ),
                  GradeListItem(
                    width: width,
                    height: height,
                    gradeName: 'PE',
                  ),
                  GradeListItem(
                    width: width,
                    height: height,
                    gradeName: 'Physics',
                  ),
                  GradeListItem(
                    width: width,
                    height: height,
                    gradeName: 'Chemistry',
                  ),
                  GradeListItem(
                    width: width,
                    height: height,
                    gradeName: 'Computer Science',
                  ),
                  GradeListItem(
                    width: width,
                    height: height,
                    gradeName: 'Biology',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradeListItem extends StatelessWidget {
  const GradeListItem({
    Key key,
    @required this.width,
    @required this.height,
    this.gradeName,
  }) : super(key: key);

  final double width;
  final double height;
  final String gradeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5),
      width: width,
      height: height * 0.065,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.bookmark, color: Colors.black87),
          SizedBox(
            width: 15,
          ),
          Text(
            gradeName,
            style: GoogleFonts.montserrat(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: height * 0.025,
            ),
          ),
        ],
      ),
    );
  }
}
