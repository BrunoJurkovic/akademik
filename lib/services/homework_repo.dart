import 'package:akademik/providers/homework.dart';
import 'package:akademik/utils/dateutils.dart';
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
    var list = _homeworkList.where((final homework) {
      return homework.timeDue.isAfter(DateUtil.getTodaysDate()) &
          homework.timeDue.isBefore(DateUtil.getTomorrowsDate());
    }).toList();
    print('TODAY: $list');
    return list;
  }

  List<AkademikHomework> get getTomorrowHomework {
    var list = _homeworkList.where((final homework) {
      return homework.timeDue.isAfter(DateUtil.getTomorrowsDate()) &
          homework.timeDue.isBefore(DateUtil.getDayAfterTomorrowsDate());
    }).toList();
    print('TOMORROW: $list');
    return list;
  }

  List<AkademikHomework> get getOtherHomework {
    var list = _homeworkList.where((final homework) {
      return !homework.timeDue.isAfter(DateUtil.getDayAfterTomorrowsDate());
    }).toList();
    print('OTHER: $list');
    return list;
  }

  Future<void> getHomeworkList() async {
    QuerySnapshot query;
    query = await _instance.get();
    // query.docs.map(
    //   (doc) => _homeworkList.add(
    //     AkademikHomework.fromDocument(doc),
    //   ),
    // );
    query.docs.forEach((homeworkItem) {
      _homeworkList.add(AkademikHomework.fromDocument(homeworkItem));
    });
    notifyListeners();
  }
}
