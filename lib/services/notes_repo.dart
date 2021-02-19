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

    query.docs.forEach((doc) {
      _notes.add(AkademikNote.fromDocument(doc));
    });

    print('NOTES $notes');

    notifyListeners();
  }

  Future<void> updateOrCreateNote(AkademikNote note) async {
    _notes.removeWhere((element) => element.noteId == note.noteId);
    _notes.add(note);
    await reference.doc(note.noteId).set(AkademikNote.noteToMap(note));
    notifyListeners();
  }

  Future<void> deleteNote(AkademikNote note) async {
    _notes.removeWhere((element) => element.noteId == note.noteId);
    await reference.doc(note.noteId).delete();
    notifyListeners();
  }
}
