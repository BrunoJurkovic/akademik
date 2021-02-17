import 'package:akademik/providers/notes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteEditScreen extends StatefulWidget {
  final AkademikNote noteItem;

  const NoteEditScreen({Key key, this.noteItem}) : super(key: key);

  @override
  _NoteEditScreenState createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final _formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(icon: Icon(CupertinoIcons.trash), onPressed: () {})
        ],
      ),
      body: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: FormBuilderTextField(
                attribute: 'title',
                autocorrect: true,
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title...',
                  hintStyle: GoogleFonts.montserrat(
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.03,
                  ),
                ),
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.03,
                ),
              ),
            ),
            Divider(
              color: Colors.black26,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              width: width,
              child: FormBuilderTextField(
                attribute: 'note',
                autocorrect: true,
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '',
                  hintStyle: GoogleFonts.montserrat(
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.02,
                  ),
                ),
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.02,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
