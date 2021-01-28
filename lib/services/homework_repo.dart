import 'package:akademik/providers/homework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeworkRepository with ChangeNotifier {
  final CollectionReference _instance =
      FirebaseFirestore.instance.collection('homework');
  final List<AkademikHomework> _homeworkList = [];

  List<AkademikHomework> get homework {
    return _homeworkList ?? [];
  }

  List<AkademikHomework> get getTodayHomework {
    List<AkademikHomework> list = _homeworkList.where((homework) {
      // homework.timeDue.isAfter();
    });
  }

  Future<void> getHomeworkList() async {
    QuerySnapshot query;
    query = await _instance.get();
    query.docs.map(
      (doc) => _homeworkList.add(
        AkademikHomework.fromDocument(doc),
      ),
    );
  }
}
