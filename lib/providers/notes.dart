import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AkademikNote with ChangeNotifier {
  final String className;
  final DateTime dateModified;
  final String userId;
  final String note;
  final String noteId;

  AkademikNote(
      {this.className, this.dateModified, this.userId, this.note, this.noteId});

  factory AkademikNote.fromDocument(DocumentSnapshot doc) {
    return AkademikNote(
      className: doc['className'] as String,
      dateModified:
          DateTime.fromMillisecondsSinceEpoch(doc['dateModified'] as int),
      userId: doc['userId'] as String,
      note: doc['note'] as String,
      noteId: doc.id,
    );
  }

  static Map<String, dynamic> noteToMap(AkademikNote note) {
    return {
      'className': note.className,
      'dateModified': note.dateModified.millisecondsSinceEpoch,
      'userId': note.userId,
      'note': note.note,
      'noteId': note.noteId,
    };
  }
}
