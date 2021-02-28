import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:akademik/components/title_widget.dart';
import 'package:akademik/providers/grades.dart';
import 'package:akademik/providers/user.dart';
import 'package:akademik/services/grades_repo.dart';
import 'package:akademik/services/user_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AdminGradesScreen extends StatefulWidget {
  const AdminGradesScreen({Key key, this.subject}) : super(key: key);

  @override
  _AdminGradesScreenState createState() => _AdminGradesScreenState();
  final String subject;
}

class _AdminGradesScreenState extends State<AdminGradesScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await Provider.of<UserRepository>(context, listen: false).getAllUsers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final grades = Provider.of<GradeRepository>(context, listen: true)
        .getGradesBySubject(widget.subject);
    final users = Provider.of<UserRepository>(context).allUsers;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.add),
              onPressed: () async {
                var userId = await showConfirmationDialog(
                  context: context,
                  title: 'Which student do you want to enter a grade for?',
                  message: 'Select a student',
                  actions: buildUserList(users),
                );
                var grade = await showConfirmationDialog(
                  context: context,
                  title: 'What grade did the student get?',
                  message: 'Select a grade',
                  actions: [
                    AlertDialogAction(label: '1', key: 1),
                    AlertDialogAction(label: '2', key: 2),
                    AlertDialogAction(label: '3', key: 3),
                    AlertDialogAction(label: '4', key: 4),
                    AlertDialogAction(label: '5', key: 5),
                  ],
                );
                var inputResult = await showTextInputDialog(
                  context: context,
                  title: 'Enter some info about the exam.',
                  textFields: [
                    DialogTextField(hintText: 'Description...'),
                  ],
                );
                await Provider.of<GradeRepository>(context, listen: false)
                    .addGrade(userId, widget.subject, inputResult[0], grade);
              }),
        ],
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 30),
            child: TitleWidget(text: 'Grades'),
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
    );
  }

  List<AlertDialogAction> buildUserList(List<AkademikUser> users) {
    var returnable = <AlertDialogAction>[];
    users.forEach((user) {
      returnable.add(AlertDialogAction(label: user.name, key: user.userId));
    });
    return returnable;
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
