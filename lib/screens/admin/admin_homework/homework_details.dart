import 'package:akademik/components/title_widget.dart';
import 'package:akademik/providers/homework.dart';
import 'package:akademik/providers/user.dart';
import 'package:akademik/services/homework_repo.dart';
import 'package:akademik/services/user_repo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class HomeworkDetailsScreen extends StatefulWidget {
  final AkademikHomework homework;

  const HomeworkDetailsScreen({Key key, this.homework}) : super(key: key);

  @override
  _HomeworkDetailsScreenState createState() => _HomeworkDetailsScreenState();
}

class _HomeworkDetailsScreenState extends State<HomeworkDetailsScreen> {
  List<AkademikHomework> allHomework = [];
  List<AkademikUser> completedUsers = [];
  List<AkademikUser> allUsers = [];
  AkademikHomework currentHomework = AkademikHomework();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<UserRepository>(context, listen: false).getAllUsers();
      await Provider.of<HomeworkRepository>(context, listen: false)
          .getListCompletedHomework(widget.homework.homeworkId);
    });

    super.initState();
  }

  bool isCurrentUserCompleted(int index) {
    return completedUsers.contains(allUsers[index]);
  }

  @override
  Widget build(BuildContext context) {
    allHomework =
        Provider.of<HomeworkRepository>(context, listen: true).getOtherHomework;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    completedUsers = Provider.of<HomeworkRepository>(context).finishedUsers;
    allUsers = Provider.of<UserRepository>(context).allUsers;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.check_mark),
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.8),
        onPressed: () async {
          _formKey.currentState.save();
          currentHomework = AkademikHomework(
            aclass: _formKey.currentState.value['class'],
            assignment: _formKey.currentState.value['description'],
            description: _formKey.currentState.value['description'],
            homeworkId: widget.homework.homeworkId ?? Uuid().v4(),
            isFinished: true,
            timeAssigned: DateTime.now(),
            timeDue: _formKey.currentState.value['timeDue'],
            userId: Provider.of<UserRepository>(context, listen: false)
                .currentUser
                .userId,
          );
          await Provider.of<HomeworkRepository>(context, listen: false)
              .createOrUpdateHomework(currentHomework);
          ExtendedNavigator.root.pop();
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
        title: Text(
          'Edit Homework',
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
      body: FormBuilder(
        key: _formKey,
        initialValue: {
          'class': widget.homework.aclass,
          'description': widget.homework.description,
          'timeDue': widget.homework.timeDue,
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width * 0.95,
              height: height * 0.08,
              padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
              child: FormBuilderTextField(
                attribute: 'class',
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.03,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Class',
                  hintStyle: GoogleFonts.montserrat(
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.03,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black26,
            ),
            Container(
              width: width * 0.95,
              height: height * 0.08,
              padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
              child: FormBuilderTextField(
                attribute: 'description',
                style: GoogleFonts.montserrat(
                  color: Colors.black.withOpacity(0.85),
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.025,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Description',
                  hintStyle: GoogleFonts.montserrat(
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.025,
                  ),
                ),
              ),
            ),
            Container(
              width: width * 0.95,
              height: height * 0.125,
              padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
              child: FormBuilderDateTimePicker(
                attribute: 'timeDue',
                inputType: InputType.date,
                fieldLabelText: 'Time Due',
                style: GoogleFonts.montserrat(
                  color: Colors.black.withOpacity(0.85),
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.025,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Time Due',
                  hintStyle: GoogleFonts.montserrat(
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.025,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: TitleWidget(text: 'Status'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
              width: width * 0.95,
              height: height * 0.35,
              child: Center(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (ctx, index) {
                    var completed = isCurrentUserCompleted(index);
                    return Container(
                      decoration:
                          BoxDecoration(color: Colors.green.withOpacity(0.35)),
                      width: width * 0.9,
                      height: height * 0.06,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                  allUsers[index].pictureUrl),
                            ),
                          ),
                          SizedBox(width: width * 0.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                allUsers[index].name,
                                style: GoogleFonts.montserrat(
                                  color: Colors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.w500,
                                  fontSize: height * 0.02,
                                ),
                              ),
                              Text(
                                '${allUsers[index].year}th grade',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.w500,
                                  fontSize: height * 0.02,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.3,
                          ),
                          Checkbox(
                            value: completed,
                            onChanged: (val) {
                              setState(() {
                                completed = val;
                              });
                            },
                            activeColor:
                                Colors.deepPurpleAccent.withOpacity(0.8),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
