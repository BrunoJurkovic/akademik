import 'package:flutter/material.dart';

class AkademikNote with ChangeNotifier {
  final String className;
  final DateTime dateModified;
  final String userId;
  final String note;

  AkademikNote({this.className, this.dateModified, this.userId, this.note});
}
