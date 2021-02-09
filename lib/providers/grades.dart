import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AkademikGrades with ChangeNotifier {
  final String userId;
  final String description;
  final String className;
  final DateTime timestamp;

  AkademikGrades(
      {this.userId, this.description, this.className, this.timestamp});

  factory AkademikGrades.fromDocument(DocumentSnapshot doc) {
    return AkademikGrades(
      userId: doc['userId'],
      description: doc['description'],
      className: doc['className'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(doc['timestamp'] as int),
    );
  }
}
