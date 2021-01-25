import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isChecked = false;
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
              child: CircleAvatar(),
              padding: EdgeInsets.only(right: width * 0.03),
            ),
          ],
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.85),
          title: Transform(
            transform: Matrix4.translationValues(-(width * 0.15), 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bruno Jurković',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.025,
                  ),
                ),
                Text(
                  '3.C Razred',
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
            onPressed: () {},
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
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
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
                                  'Read page 54 and answer the questions.',
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
                                Text(
                                  'English',
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

class SwiperCarousel extends StatelessWidget {
  const SwiperCarousel({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Container(
        width: width * 0.80,
        height: width * 0.45,
        child: Swiper(
          itemCount: 10,
          viewportFraction: 0.8,
          scale: 0.9,
          outer: true,
          itemBuilder: (ctx, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue.withOpacity(0.25),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.09,
                    width: width * 0.25,
                    padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        'assets/images/stock.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.55,
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text(
                      'School is shutting down!',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        color: Colors.black.withOpacity(0.9),
                        fontWeight: FontWeight.w500,
                        fontSize: height * 0.023,
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.55,
                    padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Text(
                      '14.1.2021',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.w700,
                        fontSize: height * 0.017,
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
