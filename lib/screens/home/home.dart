import 'package:akademik/providers/homework.dart';
import 'package:akademik/providers/news.dart';
import 'package:akademik/services/homework_repo.dart';
import 'package:akademik/services/news_repo.dart';
import 'package:akademik/services/user_repo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  var _isChecked = false;
  List<AkademikHomework> todaysHomework = [];
  List<AkademikNews> news = [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<UserRepository>(context, listen: false)
          .getCurrentUser();
      await Provider.of<NewsRepository>(context, listen: false).getNews();
      await Provider.of<HomeworkRepository>(context, listen: false)
          .getHomeworkList();
      todaysHomework = Provider.of<HomeworkRepository>(context, listen: false)
          .getTodayHomework;
      news = Provider.of<NewsRepository>(context, listen: false).news;
      print(todaysHomework);
      print(news.toString());
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.075),
        child: AppBar(
          actions: [
            Padding(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  Provider.of<UserRepository>(context).currentUser.pictureUrl,
                ),
              ),
              padding: EdgeInsets.only(right: width * 0.03),
            ),
          ],
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
          title: Transform(
            transform: Matrix4.translationValues(-(width * 0.15), 0.0, 0.0),
            child: _isLoading
                ? CircularProgressIndicator()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Provider.of<UserRepository>(context).currentUser.name,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: height * 0.025,
                        ),
                      ),
                      Text(
                        '${Provider.of<UserRepository>(context).currentUser.year}th grade',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: height * 0.02,
                        ),
                      ),
                    ],
                  ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.bars,
            ),
            onPressed: () {
              ExtendedNavigator.of(context).push('/menu-screen');
            },
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.03, width * 0.05, 0, 0),
            child: TitleWidget(
              text: 'News',
            ),
          ),
          SwiperCarousel(width: width, height: height),
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.03, width * 0.05, 0, 0),
            child: TitleWidget(
              text: "Today's Homework",
            ),
          ),
          Container(
            height: height * 0.5,
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: todaysHomework.length,
              itemBuilder: (BuildContext context, int index) {
                print(todaysHomework);
                return Column(
                  children: [
                    Container(
                      width: width * 0.9,
                      height: height * 0.075,
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.3),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.deepPurpleAccent.withOpacity(
                              0.9,
                            ),
                            value: _isChecked,
                            onChanged: (check) {
                              //
                            },
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 15, 0, 3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  todaysHomework[index].assignment,
                                  overflow: TextOverflow.fade,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.015,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.0075,
                                ),
                                todaysHomework.isNotEmpty
                                    ? Text(
                                        todaysHomework[index].aclass,
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w500,
                                          fontSize: height * 0.013,
                                        ),
                                      )
                                    : Text(
                                        'There is no homework today.',
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w500,
                                          fontSize: height * 0.013,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SwiperCarousel extends StatefulWidget {
  const SwiperCarousel({
    Key key,
    @required this.width,
    @required this.height,
    @required this.news,
  }) : super(key: key);

  final double width;
  final double height;
  final List<AkademikNews> news;

  @override
  _SwiperCarouselState createState() => _SwiperCarouselState();
}

class _SwiperCarouselState extends State<SwiperCarousel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Container(
        width: widget.width * 0.80,
        height: widget.width * 0.45,
        child: Swiper(
          itemCount: widget.news?.length ?? 0,
          viewportFraction: 0.8,
          scale: 0.9,
          outer: true,
          itemBuilder: (ctx, index) {
            return Container(
              decoration: BoxDecoration(
                color: Color(widget.news[index].color).withOpacity(0.25),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: widget.height * 0.09,
                    width: widget.width * 0.25,
                    padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.network(
                        widget.news[index].imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    width: widget.width * 0.55,
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text(
                      widget.news[index].name,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        color: Colors.black.withOpacity(0.9),
                        fontWeight: FontWeight.w500,
                        fontSize: widget.height * 0.023,
                      ),
                    ),
                  ),
                  Container(
                    width: widget.width * 0.55,
                    padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Text(
                      DateFormat('dd-MM-yyyy')
                          .format(widget.news[index].timestamp),
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.w700,
                        fontSize: widget.height * 0.017,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Text(
      text ?? '',
      textAlign: TextAlign.left,
      style: GoogleFonts.montserrat(
        color: Colors.deepPurpleAccent.withOpacity(0.9),
        fontWeight: FontWeight.w700,
        fontSize: height * 0.033,
      ),
    );
  }
}
