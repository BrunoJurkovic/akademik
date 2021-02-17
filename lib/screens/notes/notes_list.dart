import 'package:akademik/providers/notes.dart';
import 'package:akademik/routes/akademik_router.gr.dart';
import 'package:akademik/services/notes_repo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotesListScreen extends StatefulWidget {
  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  List<AkademikNote> notes = [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      notes = Provider.of<NotesRepository>(context, listen: false).notes;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.add),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
        title: Text(
          'Notes',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: height * 0.025,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              onTap: () {
                ExtendedNavigator.root.push('/note-edit-screen',
                    arguments: NoteEditScreenArguments(noteItem: notes[index]));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    vertical: BorderSide(
                      color: Colors.blueGrey.withOpacity(0.3),
                    ),
                  ),
                ),
                width: width,
                height: height * 0.1,
                child: Card(
                  elevation: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            width * 0.03, height * 0.015, 0, 0),
                        child: Text(
                          notes[index].className,
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.023,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            width * 0.03, height * 0.01, 0, 0),
                        child: Text(
                          notes[index].note.trim(),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.montserrat(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.018,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
