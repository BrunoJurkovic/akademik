import 'package:akademik/providers/notes.dart';
import 'package:flutter/material.dart';

class NoteEditScreen extends StatefulWidget {
  final AkademikNote noteItem;

  const NoteEditScreen({Key key, this.noteItem}) : super(key: key);

  @override
  _NoteEditScreenState createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
