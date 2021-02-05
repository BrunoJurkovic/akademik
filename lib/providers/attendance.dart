import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum AttendanceStatus {
  waiting,
  approved,
  disapproved,
}

class AkademikAttendance with ChangeNotifier {
  final String userId;
  final DateTime timestamp;
  final String aclass;
  final int classTime;
  final String reason;
  final String status;

  factory AkademikAttendance.fromDocument(DocumentSnapshot doc) {
    return AkademikAttendance(
      userId: doc['userId'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(doc['timestamp'] as int),
      aclass: doc['class'] as String,
      classTime: doc['classTime'] as int,
      reason: doc['reason'] as String,
      status: doc['status'] as String,
    );
  }

  AkademikAttendance(
      {this.userId,
      this.timestamp,
      this.aclass,
      this.classTime,
      this.reason,
      this.status});
}
