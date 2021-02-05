import 'package:akademik/providers/attendance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceRepository with ChangeNotifier {
  final CollectionReference _attendanceReference =
      FirebaseFirestore.instance.collection('attendance');
  final List<AkademikAttendance> _attendanceList = [];

  Future<void> fetchAttendance(String userId) async {
    final query = await _attendanceReference
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp')
        .get();
    query.docs.forEach((doc) {
      _attendanceList.add(AkademikAttendance.fromDocument(doc));
    });
    notifyListeners();
  }

  List<AkademikAttendance> get getAttendanceList {
    return _attendanceList;
  }
}
