import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AkademikNews with ChangeNotifier {
  final String name;
  final String description;
  final String imageUrl;
  final DateTime timestamp;
  final int color;

  AkademikNews(
      {this.name, this.description, this.imageUrl, this.timestamp, this.color});

  factory AkademikNews.fromDocument(DocumentSnapshot doc) {
    return AkademikNews(
      name: doc['name'] as String,
      description: doc['description'] as String,
      imageUrl: doc['imageUrl'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(doc['timestamp'] as int),
      color: int.parse(doc['color'] as String),
    );
  }
}
