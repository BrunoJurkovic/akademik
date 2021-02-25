import 'package:akademik/components/homework_list.dart';
import 'package:akademik/components/title_widget.dart';
import 'package:akademik/providers/homework.dart';
import 'package:akademik/services/homework_repo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeworkDetailsScreen extends StatefulWidget {
  final AkademikHomework homework;

  const HomeworkDetailsScreen({Key key, this.homework}) : super(key: key);

  @override
  _HomeworkDetailsScreenState createState() => _HomeworkDetailsScreenState();
}

class _HomeworkDetailsScreenState extends State<HomeworkDetailsScreen> {
  List<AkademikHomework> allHomework = [];
  @override
  Widget build(BuildContext context) {
    allHomework =
        Provider.of<HomeworkRepository>(context, listen: true).getOtherHomework;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
          )),
    );
  }
}
