import 'package:akademik/providers/exams.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ExamsRepository with ChangeNotifier {
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('exams');
  final List<AkademikExams> _examList = [];

  Future<void> fetchExamList(String classId) async {
    final query = await _reference
        .where('classId', isEqualTo: classId)
        .orderBy('timestamp')
        .get();
    query.docs.forEach((doc) {
      _examList.add(AkademikExams.fromDocument(doc));
    });
    notifyListeners();
  }
}
