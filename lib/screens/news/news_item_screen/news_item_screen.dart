import 'package:akademik/providers/news.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

class NewsItemScreen extends StatefulWidget {
  final AkademikNews newsItem;

  const NewsItemScreen({Key key, this.newsItem}) : super(key: key);

  @override
  _NewsItemScreenState createState() => _NewsItemScreenState();
}

class _NewsItemScreenState extends State<NewsItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
