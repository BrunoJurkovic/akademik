import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AkademikHomework with ChangeNotifier {
  final String aclass;
  final String assignment;
  final String description;
  final bool isFinished;
  final String userId;
  final DateTime timeAssigned;
  final DateTime timeDue;
  final String homeworkId;

  factory AkademikHomework.fromDocument(DocumentSnapshot doc) {
    return AkademikHomework(
      assignment: doc['assignment'] as String,
      aclass: doc['class'] as String,
      description: doc['description'] as String,
      isFinished: doc['isFinished'] as bool,
      timeAssigned:
          DateTime.fromMillisecondsSinceEpoch(doc['timeAssigned'] as int),
      timeDue: DateTime.fromMillisecondsSinceEpoch(doc['timeDue'] as int),
      userId: doc['userId'] as String,
      homeworkId: doc.id,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'assignment': assignment,
      'description': description,
      'isFinished': isFinished,
      'userId': userId,
      'timeAssigned': timeAssigned.millisecondsSinceEpoch,
      'timeDue': timeDue.millisecondsSinceEpoch,
    };
  }

  AkademikHomework(
      {this.aclass,
      this.description,
      this.userId,
      this.isFinished,
      this.assignment,
      this.timeAssigned,
      this.timeDue,
      this.homeworkId});
}
