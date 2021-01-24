import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          Padding(
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
                  // return new Image.network(
                  //   "https://via.placeholder.com/288x188",
                  //   fit: BoxFit.fill,
                  // );
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
          )
        ],
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
