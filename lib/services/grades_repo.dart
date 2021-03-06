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

  List<AkademikGrades> getGradesBySubject(String className) {
    return _grades.where((element) => element.className == className).toList();
  }

  Future<void> addGrade(
      String userId, String className, String description, int grade) async {
    var newGrade = AkademikGrades(
      className: className,
      userId: userId,
      grade: grade,
      description: description,
      timestamp: DateTime.now(),
    );
    _grades.add(newGrade);
    await _reference.add({
      'className': className,
      'description': description,
      'grade': grade,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'userId': userId,
    });
    notifyListeners();
  }

  Future<void> fetchGrades(String userId) async {
    final query = await _reference
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .get();

    query.docs.forEach((doc) {
      _grades.add(AkademikGrades.fromDocument(doc));
    });
    print('GRADES: $_grades');
    notifyListeners();
  }
}
