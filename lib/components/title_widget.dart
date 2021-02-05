import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key key, @required this.text, this.color})
      : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Text(
      text ?? '',
      textAlign: TextAlign.left,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.deepPurpleAccent.withOpacity(0.9),
        fontWeight: FontWeight.w700,
        fontSize: height * 0.033,
      ),
    );
  }
}
