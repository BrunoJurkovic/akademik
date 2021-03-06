import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:akademik/providers/attendance.dart';
import 'package:akademik/providers/user.dart';
import 'package:akademik/services/attendance_repo.dart';
import 'package:akademik/services/user_repo.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AdminAttendanceScreen extends StatefulWidget {
  @override
  _AdminAttendanceScreenState createState() => _AdminAttendanceScreenState();
}

class _AdminAttendanceScreenState extends State<AdminAttendanceScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await Provider.of<UserRepository>(context, listen: false).getAllUsers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final attendance = Provider.of<AttendanceRepository>(context, listen: true)
        .getAttendanceList;
    var currentDate = DateTime.now();
    final users = Provider.of<UserRepository>(context).allUsers;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
        title: Text(
          'Attendance',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: height * 0.025,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.add),
            onPressed: () async {
              var userId = await showConfirmationDialog(
                context: context,
                title: 'Who is missing?',
                message: 'Select a student',
                actions: buildUserList(users),
              );
              var classNumber = await showConfirmationDialog(
                context: context,
                title: 'Which class is he missing from?',
                actions: [
                  AlertDialogAction(label: '0th class', key: '0'),
                  AlertDialogAction(label: '1st class', key: '1'),
                  AlertDialogAction(label: '2nd class', key: '2'),
                  AlertDialogAction(label: '3rd class', key: '3'),
                  AlertDialogAction(label: '4th class', key: '4'),
                  AlertDialogAction(label: '5th class', key: '5'),
                  AlertDialogAction(label: '6th class', key: '6'),
                  AlertDialogAction(label: '7th class', key: '7'),
                  AlertDialogAction(label: '8th class', key: '8'),
                  AlertDialogAction(label: '9th class', key: '9'),
                ],
              );
              var subject = await showConfirmationDialog(
                  context: context,
                  title: 'What is the name of the class?',
                  actions: [
                    AlertDialogAction(label: 'English', key: 'English'),
                    AlertDialogAction(label: 'Biology', key: 'Biology'),
                    AlertDialogAction(label: 'PE', key: 'PE'),
                    AlertDialogAction(
                        label: 'Computer Science', key: 'Computer Science'),
                    AlertDialogAction(label: 'Physics', key: 'Physics'),
                    AlertDialogAction(label: 'Chemistry', key: 'Chemistry'),
                  ]);
              await Provider.of<AttendanceRepository>(context, listen: false)
                  .updateOrCreateAttendance(
                      userId, int.parse(classNumber), subject);
              await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.success,
                  text: 'Added successfully.');
            },
          )
        ],
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
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Showing for ${DateFormat.yMMMMd().format(DateTime.now())}',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.025,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Center(
            child: Container(
              width: width * 0.95,
              height: height * 0.5,
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: {
                  0: FractionColumnWidth(0.3),
                  1: FractionColumnWidth(0.05),
                  2: FractionColumnWidth(0.05),
                  3: FractionColumnWidth(0.05),
                  4: FractionColumnWidth(0.05),
                  5: FractionColumnWidth(0.05),
                  6: FractionColumnWidth(0.05),
                  7: FractionColumnWidth(0.05),
                  8: FractionColumnWidth(0.05),
                  9: FractionColumnWidth(0.05),
                  10: FractionColumnWidth(0.05),
                },
                border: TableBorder.all(color: Colors.black38),
                children: [
                  buildInitalTableRow(height),
                  // ...buildTableRowFromList(
                  //   attendanceList: attendance,
                  //   height: height,
                  //   width: width,
                  // ),
                  ...buildAttendanceFromList(
                      attendance: attendance,
                      currentDate: currentDate,
                      users: users),
                ],
              ),
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

  List<TableRow> buildAttendanceFromList(
      {List<AkademikUser> users,
      List<AkademikAttendance> attendance,
      DateTime currentDate}) {
    var todaysAttendance = [];
    todaysAttendance.addAll(
      attendance.where((element) => element.timestamp.day == currentDate.day),
    );
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<TableRow> returnables = [];
    users.forEach((user) {
      todaysAttendance.forEach((attendanceItem) {
        if (user.userId == attendanceItem.userId) {
          returnables.add(TableRow(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: Text(
                  user.name,
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
                  attendanceItem.classTime == 0 ? '0' : '/',
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
                  attendanceItem.classTime == 1 ? '1' : '/',
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
                  attendanceItem.classTime == 2 ? '2' : '/',
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
                  attendanceItem.classTime == 3 ? '3' : '/',
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
                  attendanceItem.classTime == 4 ? '4' : '/',
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
                  attendanceItem.classTime == 5 ? '5' : '/',
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
                  attendanceItem.classTime == 6 ? '6' : '/',
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
                  attendanceItem.classTime == 7 ? '7' : '/',
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
                  attendanceItem.classTime == 8 ? '8' : '/',
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
                  attendanceItem.classTime == 9 ? '9' : '/',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: height * 0.019,
                  ),
                ),
              ),
            ],
          ));
        }
      });
    });
    return returnables;
  }

  TableRow buildInitalTableRow(double height) {
    return TableRow(
      decoration:
          BoxDecoration(color: Colors.deepPurpleAccent.withOpacity(0.5)),
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
          child: Text(
            'Full Name',
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
            '0',
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
            '1',
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
            '2',
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
            '3',
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
            '4',
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
            '5',
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
            '6',
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
            '7',
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
            '8',
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
            '9',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: height * 0.019,
            ),
          ),
        ),
      ],
    );
  }
}
