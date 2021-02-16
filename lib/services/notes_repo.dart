import 'package:akademik/providers/notes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotesRepository with ChangeNotifier {
  final List<AkademikNote> _notes = [];
  final CollectionReference reference =
      FirebaseFirestore.instance.collection('notes');
}
