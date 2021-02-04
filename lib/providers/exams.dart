import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AkademikExams with ChangeNotifier {
  final String className;
  final DateTime date;
  final String description;
  final String classId;
  final String examId;

  AkademikExams(
      {this.className, this.date, this.description, this.classId, this.examId});

  factory AkademikExams.fromDocument(DocumentSnapshot doc) {
    return AkademikExams(
      classId: doc['classId'] as String,
      className: doc['className'] as String,
      description: doc['description'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(doc['date'] as int),
      examId: doc.id,
    );
  }
}
