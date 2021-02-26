import 'package:akademik/components/title_widget.dart';
import 'package:akademik/providers/grades.dart';
import 'package:akademik/services/grades_repo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GradesScreen extends StatefulWidget {
  @override
  _GradesScreenState createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  List<AkademikGrades> grades = [];

  // @override
  // void initState() {
  //   Future.delayed(Duration.zero, () async {
  //     grades = Provider.of<GradeRepository>(context, listen: false).grades;
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    grades = Provider.of<GradeRepository>(context, listen: false).grades;
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: TitleWidget(text: 'Grades'),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: width,
              height: height * 0.75,
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: {
                  0: FractionColumnWidth(0.2),
                  1: FractionColumnWidth(0.2),
                  2: FractionColumnWidth(0.3),
                  3: FractionColumnWidth(0.12),
                },
                border: TableBorder.all(color: Colors.black38),
                children: [
                  buildInitalTableRow(height),
                  ...buildTableRowFromList(
                    gradesList: grades,
                    height: height,
                    width: width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<TableRow> buildTableRowFromList(
      {List<AkademikGrades> gradesList, double height, double width}) {
    var returnable = <TableRow>[];
    gradesList.forEach(
      (element) {
        returnable.add(
          TableRow(
            children: [
              // Padding(
              //   padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
              //   child: Text(
              //     DateFormat.yMMMd().format(element.timestamp),
              //     style: GoogleFonts.montserrat(
              //       color: Colors.black,
              //       fontWeight: FontWeight.w700,
              //       fontSize: height * 0.019,
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: Text(
                  '${element.className}',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: height * 0.019,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: Text(
                  element.grade.toString(),
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: height * 0.019,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: Text(
                  element.description,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: height * 0.019,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: Text(
                  DateFormat.yMMMd().format(element.timestamp),
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: height * 0.019,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    return returnable;
  }

  TableRow buildInitalTableRow(double height) {
    return TableRow(
      decoration:
          BoxDecoration(color: Colors.deepPurpleAccent.withOpacity(0.35)),
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
          child: Text(
            'Class',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: height * 0.019,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
          child: Text(
            'Grade',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: height * 0.019,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
          child: Text(
            'Description',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: height * 0.019,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
          child: Text(
            'Date',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: height * 0.019,
            ),
          ),
        ),
      ],
    );
  }
}
