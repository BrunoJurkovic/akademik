import 'package:akademik/providers/news.dart';
import 'package:akademik/routes/akademik_router.gr.dart';
import 'package:akademik/screens/news/news_item_screen/news_item_screen.dart';
import 'package:akademik/services/news_repo.dart';
import 'package:akademik/utils/stroke_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<AkademikNews> newsList = [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        newsList = Provider.of<NewsRepository>(context, listen: false).news;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
        title: Text(
          'News',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: height * 0.025,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              onTap: () {
                ExtendedNavigator.root.push(Routes.newsItemScreen,
                    arguments:
                        NewsItemScreenArguments(newsItem: newsList[index]));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Container(
                          height: height * 0.18,
                          width: width * 0.95,
                          child: CachedNetworkImage(
                            imageUrl: newsList[index].imageUrl,
                            fit: BoxFit.cover,
                            color: Colors.black45,
                            colorBlendMode: BlendMode.multiply,
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.025,
                        left: 10,
                        child: Text(
                          newsList[index].name,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.02,
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.13,
                        left: 10,
                        child: Text(
                          DateFormat.MMMd().format(newsList[index].timestamp),
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.015,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
