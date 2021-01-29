import 'package:akademik/providers/news.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewsRepository with ChangeNotifier {
  final List<AkademikNews> _news = [];
  final CollectionReference _newsCollection =
      FirebaseFirestore.instance.collection('news');

  List<AkademikNews> get news {
    return _news;
  }

  Future<void> getNews() async {
    final query = await _newsCollection.get();
    query.docs.forEach((doc) {
      _news.add(AkademikNews.fromDocument(doc));
    });
    notifyListeners();
  }
}
