import 'package:flutter/material.dart';

class AkademikHomework with ChangeNotifier {
  final String aclass;
  final String description;
  final bool isFinished;
  final String userId;

  AkademikHomework(
      {this.aclass, this.description, this.userId, this.isFinished});
}
