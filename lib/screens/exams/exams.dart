import 'package:akademik/providers/exams.dart';
import 'package:akademik/services/exams_repo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class ExamsScreen extends StatefulWidget {
  @override
  _ExamsScreenState createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {
  CalendarController _calendarController;
  List<AkademikExams> examList = [];
  Map<DateTime, List<dynamic>> eventMap = {};
  List _selectedEvents = [];
  var _isExpanded = false;

  @override
  void initState() {
    _calendarController = CalendarController();
    Future.delayed(Duration.zero, () async {
      examList = Provider.of<ExamsRepository>(context, listen: false).examList;
      print(examList);
      buildEventMap();
    });
    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TableCalendar(
            onDaySelected: (DateTime day, List events, _) => {
              setState(() {
                _selectedEvents = events;
              })
            },
            events: eventMap,
            calendarController: _calendarController,
            initialCalendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
          ),
          Container(
            width: width,
            height: height * 0.5,
            child: _selectedEvents.isEmpty
                ? Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'There are no exams on the selected day.',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                          color: Colors.black.withOpacity(0.9),
                          fontWeight: FontWeight.w500,
                          fontSize: height * 0.0225,
                        ),
                      ),
                      Image.asset('assets/images/homework.png')
                    ],
                  )
                : Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: {
                      0: FractionColumnWidth(0.1),
                      1: FractionColumnWidth(0.2),
                      2: FractionColumnWidth(0.1),
                    },
                    border: TableBorder.all(color: Colors.black38),
                    children: [
                      buildInitalTableRow(height),
                      ...buildTableRowFromList(
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

  List<TableRow> buildTableRowFromList({double height, double width}) {
    List<TableRow> returnable = [];
    var examList = [];
    _selectedEvents.forEach((element) {
      examList.add(Provider.of<ExamsRepository>(context, listen: false)
          .getExamById(element));
    });
    examList.forEach(
      (element) {
        returnable.add(
          TableRow(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: Text(
                  element.className,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
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
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.019,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: Text(
                  DateFormat.MMMd().format(element.date),
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
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
          BoxDecoration(color: Colors.deepPurpleAccent.withOpacity(0.5)),
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
          child: Text(
            'Class',
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
            'Description',
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
            'Date',
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

  void buildEventMap() {
    var returnable = <DateTime, List<dynamic>>{};

    examList.forEach((element) {
      returnable.putIfAbsent(element.date, () => [element.examId]);
    });
    print('RETURNABLE: $returnable');

    setState(() {
      eventMap = returnable;
    });
  }
}

// class EventItem extends StatefulWidget {
//   final List selectedEvents;
//   final int index;

//   const EventItem({Key key, this.selectedEvents, this.index}) : super(key: key);
//   @override
//   _EventItemState createState() => _EventItemState();
// }

// class _EventItemState extends State<EventItem> {
//   bool _isExpanded = false;
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return Container(
//       width: width,
//       height: _isExpanded ? height * 0.2 : height * 0.075,
//       child: InkWell(
//         onTap: () {
//           print('tapp');
//           setState(() {
//             _isExpanded = !_isExpanded;
//           });
//         },
//         child: Card(
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
//                     child: Text(
//                       DateFormat.MMMEd().format(
//                           Provider.of<ExamsRepository>(context, listen: false)
//                               .getExamById(widget.selectedEvents[widget.index])
//                               .date),
//                       style: GoogleFonts.montserrat(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                         fontSize: height * 0.017,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: width * 0.19,
//                   ),
//                   Text(
//                     Provider.of<ExamsRepository>(context, listen: false)
//                         .getExamById(widget.selectedEvents[widget.index])
//                         .className,
//                     style: GoogleFonts.montserrat(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: height * 0.02,
//                     ),
//                   ),
//                 ],
//               ),
//               Visibility(
//                 visible: _isExpanded,
//                 child: Row(
//                   children: [],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
