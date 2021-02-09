import 'package:akademik/providers/grades.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GradeRepository with ChangeNotifier {
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('grades');
  List<AkademikGrades> _grades = [];

  List<AkademikGrades> get grades {
    return _grades;
  }

  Future<void> fetchGrades(String userId) async {
    final query = await _reference
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .get();

    query.docs.forEach((doc) {
      _grades.add(AkademikGrades.fromDocument(doc));
    });
    notifyListeners();
  }
}
