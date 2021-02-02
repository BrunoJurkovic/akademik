import 'package:akademik/components/title_widget.dart';
import 'package:akademik/providers/attendance.dart';
import 'package:akademik/services/attendance_repo.dart';
import 'package:akademik/services/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List<AkademikAttendance> attendance = [];
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await Provider.of<AttendanceRepository>(context, listen: false)
          .fetchAttendance(Provider.of<UserRepository>(context, listen: false)
              .currentUser
              .userId);
      attendance = Provider.of<AttendanceRepository>(context, listen: false)
          .getAttendanceList;
      print(attendance.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 25),
              child: TitleWidget(text: 'Attendance'),
            ),
            IndicatorDotRow(),
            SizedBox(
              height: 25,
            ),
            Container(
              width: width,
              height: height * 0.7,
              child: ListView.builder(
                itemCount: attendance.length,
                itemBuilder: (ctx, index) {
                  return Center(
                    child: Container(
                      width: width,
                      height: height * 0.05,
                      decoration: BoxDecoration(color: Colors.black12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                            child: Text(
                              DateFormat.yMMMd()
                                  .format(attendance[index].timestamp),
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.015,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                            child: Text(
                              '${attendance[index].classTime}',
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.015,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                            child: Text(
                              attendance[index].aclass,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.015,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                            child: IndicatorWidget(color: Colors.red, text: ''),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                            child: Text(
                              attendance[index].reason,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.015,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IndicatorDotRow extends StatelessWidget {
  const IndicatorDotRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IndicatorWidget(
          color: Colors.redAccent,
          text: 'Unapproved',
        ),
        SizedBox(
          width: 10,
        ),
        IndicatorWidget(
          color: Colors.greenAccent,
          text: 'Approved',
        ),
        SizedBox(
          width: 10,
        ),
        IndicatorWidget(
          color: Colors.grey,
          text: 'Waiting',
        ),
      ],
    );
  }
}

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    Key key,
    @required this.color,
    @required this.text,
  }) : super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        text.isNotEmpty
            ? SizedBox(
                width: width * 0.015,
              )
            : SizedBox(),
        Text(
          text,
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: height * 0.015,
          ),
        )
      ],
    );
  }
}
