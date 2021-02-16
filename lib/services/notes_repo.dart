import 'package:akademik/providers/notes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotesRepository with ChangeNotifier {
  final List<AkademikNote> _notes = [];
  final CollectionReference reference =
      FirebaseFirestore.instance.collection('notes');

  List<AkademikNote> get notes {
    return _notes;
  }

  Future<void> fetchNotes(String userId) async {
    final query = await reference.where('userId', isEqualTo: userId).get();

    query.docs.forEach((doc) {});
  }
}
