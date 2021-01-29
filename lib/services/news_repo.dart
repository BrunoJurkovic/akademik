import 'package:flutter/material.dart';

class NewsRepository with ChangeNotifier {
  final String name;
  final String description;
  final String imageUrl;
  final DateTime timestamp;

  NewsRepository({this.name, this.description, this.imageUrl, this.timestamp});
}
