import 'package:flutter/material.dart';

class AkademikUser with ChangeNotifier {
  final String email;
  final String username;

  AkademikUser({this.email, this.username});
}
