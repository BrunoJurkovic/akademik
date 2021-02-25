import 'package:akademik/components/homework_list.dart';
import 'package:akademik/components/title_widget.dart';
import 'package:akademik/providers/homework.dart';
import 'package:akademik/services/homework_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
    final _formKey = GlobalKey<FormBuilderState>();
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
        ),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Column(
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
              height: height * 0.3,
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
              // child: FormBuilderTextField(
              //   attribute: 'description',
              //   style: GoogleFonts.montserrat(
              //     color: Colors.black.withOpacity(0.85),
              //     fontWeight: FontWeight.w500,
              //     fontSize: height * 0.025,
              //   ),
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     hintText: 'Description',
              //     hintStyle: GoogleFonts.montserrat(
              //       color: Colors.black.withOpacity(0.5),
              //       fontWeight: FontWeight.w500,
              //       fontSize: height * 0.025,
              //     ),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
