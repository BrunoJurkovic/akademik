import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AkademikUser with ChangeNotifier {
  final String email;
  final String username;
  final int year;
  final String name;
  final String pictureUrl;
  final String userId;
  final String classId;

  factory AkademikUser.fromDocument(DocumentSnapshot doc) {
    print(doc.toString());
    return AkademikUser(
      email: doc['email'] as String,
      name: doc['name'] as String,
      pictureUrl: doc['pictureUrl'] as String,
      username: doc['username'] as String,
      year: doc['year'] as int,
      userId: doc.id,
      classId: doc['classId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'pictureUrl': pictureUrl,
      'username': username,
      'year': year,
    };
  }

  AkademikUser({
    this.year,
    this.name,
    this.pictureUrl,
    this.email,
    this.username,
    this.userId,
    this.classId,
  });
}
