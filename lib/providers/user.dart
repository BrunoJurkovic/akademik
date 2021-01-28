import 'package:flutter/material.dart';

class AkademikUser with ChangeNotifier {
  final String email;
  final String username;
  final int year;
  final String name;
  final String pictureUrl;

  AkademikUser(
      {this.year, this.name, this.pictureUrl, this.email, this.username});
}
