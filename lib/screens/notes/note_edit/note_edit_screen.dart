import 'package:akademik/providers/notes.dart';
import 'package:akademik/services/notes_repo.dart';
import 'package:akademik/services/user_repo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

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
    AkademikNote returnable;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(CupertinoIcons.checkmark),
        onPressed: () async {
          _formKey.currentState.save();
          returnable = AkademikNote(
            className: _formKey.currentState.value['title'],
            dateModified: DateTime.now(),
            note: _formKey.currentState.value['note'],
            userId: Provider.of<UserRepository>(context, listen: false)
                .currentUser
                .userId,
            noteId: widget.noteItem.noteId ?? Uuid().v4(),
          );
          await Provider.of<NotesRepository>(context, listen: false)
              .updateOrCreateNote(returnable);
          ExtendedNavigator.root.pop();
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.trash),
              onPressed: () async {
                await Provider.of<NotesRepository>(context, listen: false)
                    .deleteNote(returnable);
                ExtendedNavigator.root.pop();
              })
        ],
      ),
      body: FormBuilder(
        initialValue: <String, dynamic>{
          'title': widget.noteItem.className,
          'note': widget.noteItem.note,
        },
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
