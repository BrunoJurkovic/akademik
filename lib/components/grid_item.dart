import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AkademikGridItem extends StatelessWidget {
  const AkademikGridItem({Key key, this.text, this.callback, this.iconPath})
      : super(key: key);

  final String text;
  final Function callback;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              callback();
            },
            child: Container(
                width: width * 0.2,
                height: height * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.9),
                ),
                child: Container(
                  width: width * 0.1,
                  height: height * 0.1,
                  child: Image.asset(
                    iconPath ?? 'assets/images/bookmarkC.png',
                    fit: BoxFit.scaleDown,
                  ),
                )),
          ),
        ),
        Text(
          text,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: height * 0.022,
          ),
        ),
      ],
    );
  }
}
