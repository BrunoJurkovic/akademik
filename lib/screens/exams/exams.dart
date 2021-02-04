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
          Expanded(
            child: ListView.builder(
              itemCount: _selectedEvents.length,
              itemBuilder: (ctx, index) {
                return EventItem(
                  index: index,
                  key: Key(index.toString()),
                  selectedEvents: _selectedEvents,
                );
              },
            ),
          ),
        ],
      ),
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

class EventItem extends StatefulWidget {
  final List selectedEvents;
  final int index;

  const EventItem({Key key, this.selectedEvents, this.index}) : super(key: key);
  @override
  _EventItemState createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: _isExpanded ? height * 0.2 : height * 0.075,
      child: InkWell(
        onTap: () {
          print('tapp');
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text(
                  DateFormat.MMMEd().format(
                      Provider.of<ExamsRepository>(context, listen: false)
                          .getExamById(widget.selectedEvents[widget.index])
                          .date),
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.017,
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.19,
              ),
              Text(
                Provider.of<ExamsRepository>(context, listen: false)
                    .getExamById(widget.selectedEvents[widget.index])
                    .className,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.02,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
