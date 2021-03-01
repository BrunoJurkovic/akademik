import 'package:akademik/components/homework_list.dart';
import 'package:akademik/components/title_widget.dart';
import 'package:akademik/providers/homework.dart';
import 'package:akademik/providers/news.dart';
import 'package:akademik/routes/akademik_router.gr.dart';
import 'package:akademik/services/attendance_repo.dart';
import 'package:akademik/services/exams_repo.dart';
import 'package:akademik/services/grades_repo.dart';
import 'package:akademik/services/homework_repo.dart';
import 'package:akademik/services/news_repo.dart';
import 'package:akademik/services/notes_repo.dart';
import 'package:akademik/services/user_repo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _isLoading = true;
      });

      await Provider.of<UserRepository>(context, listen: false)
          .getCurrentUser();
      await Provider.of<NewsRepository>(context, listen: false).getNews();
      await Provider.of<HomeworkRepository>(context, listen: false)
          .getHomeworkList();
      await Provider.of<ExamsRepository>(context, listen: false).fetchExamList(
          Provider.of<UserRepository>(context, listen: false)
              .currentUser
              .classId);
      await Provider.of<GradeRepository>(context, listen: false).fetchGrades(
          Provider.of<UserRepository>(context, listen: false)
              .currentUser
              .userId);
      await Provider.of<NotesRepository>(context, listen: false).fetchNotes(
          Provider.of<UserRepository>(context, listen: false)
              .currentUser
              .userId);

      await Provider.of<AttendanceRepository>(context, listen: false)
          .fetchAttendance(Provider.of<UserRepository>(context, listen: false)
              .currentUser
              .userId);

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
    todaysHomework =
        Provider.of<HomeworkRepository>(context, listen: true).getTodayHomework;
    news = Provider.of<NewsRepository>(context, listen: true).news;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.075),
        child: AppBar(
          actions: [
            Padding(
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
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
              if (!Provider.of<UserRepository>(context, listen: false)
                  .isUserAdmin) {
                ExtendedNavigator.of(context).push('/menu-screen');
              } else {
                ExtendedNavigator.of(context).push(Routes.adminMenuScreen);
              }
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
          SwiperCarousel(width: width, height: height, news: news),
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.03, width * 0.05, 0, 0),
            child: TitleWidget(
              text: "Today's Homework",
            ),
          ),
          Container(
            height: height * 0.5,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: todaysHomework.isEmpty
                ? Column(
                    children: [
                      Text(
                        'There is no homework due today.',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                          color: Colors.black.withOpacity(0.9),
                          fontWeight: FontWeight.w500,
                          fontSize: height * 0.0225,
                        ),
                      ),
                      Image.asset('assets/images/homework.png')
                    ],
                  )
                : HomeworkList(
                    homeworkList: todaysHomework, width: width, height: height),
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
        width: widget.width,
        height: widget.width * 0.45,
        child: Swiper(
          itemCount: 3,
          viewportFraction: 0.8,
          scale: 0.9,
          outer: true,
          itemBuilder: (ctx, index) {
            return InkWell(
              onTap: () {
                ExtendedNavigator.root.push(Routes.newsItemScreen,
                    arguments:
                        NewsItemScreenArguments(newsItem: widget.news[index]));
              },
              child: Container(
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
                        child: CachedNetworkImage(
                          imageUrl: widget.news[index].imageUrl,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
