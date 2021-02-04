import 'package:akademik/providers/exams.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ExamsRepository with ChangeNotifier {
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('exams');
  final List<AkademikExams> _examList = [];

  List<AkademikExams> get examList {
    print('examList $_examList');
    return _examList;
  }

  AkademikExams getExamById(String id) {
    return _examList.firstWhere((examItem) => examItem.examId == id);
  }

  Future<void> fetchExamList(String classId) async {
    final query = await _reference.where('classId', isEqualTo: classId).get();
    query.docs.forEach((doc) {
      _examList.add(AkademikExams.fromDocument(doc));
    });
    print('fetchExamList $_examList');
    notifyListeners();
  }
}
