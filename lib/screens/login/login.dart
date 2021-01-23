import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final _formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.space,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
              width: width * 1,
              height: height * 0.35,
              child: Image.asset(
                'assets/images/login.png',
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.03, width * 0.10, 0, 0),
            child: Text(
              'Login',
              style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                  fontSize: height * 0.045),
            ),
          ),
          FormBuilder(
            key: _formKey,
            child: Container(
              width: width * 0.85,
              padding: EdgeInsets.fromLTRB(25, 15, 0, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(width * 0.03, width * 0.10, 0, 0),
                    child: Text(
                      'E-Mail',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: height * 0.025,
                      ),
                    ),
                  ),
                  FormBuilderTextField(
                    attribute: 'email',
                    autocorrect: false,
                    maxLines: 1,
                    autofocus: true,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.02,
                    ),
                    onChanged: (_) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelStyle: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: height * 0.02,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black54,
                      ),
                    ),
                    validators: [
                      FormBuilderValidators.email(
                          errorText: 'Please enter a valid e-mail address.'),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(width * 0.03, width * 0.10, 0, 0),
                    child: Text(
                      'Password',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: height * 0.025,
                      ),
                    ),
                  ),
                  FormBuilderTextField(
                    attribute: 'password',
                    autocorrect: false,
                    maxLines: 1,
                    obscureText: true,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.02,
                    ),
                    autofocus: true,
                    onChanged: (_) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelStyle: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: height * 0.02,
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.key,
                        color: Colors.black54,
                      ),
                    ),
                    validators: [
                      FormBuilderValidators.required(
                          errorText: 'Password must not be empty.'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 25),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: FlatButton(
              minWidth: width * 0.75,
              color: Colors.redAccent,
              onPressed: () {},
              child: Text(
                'Log in',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: height * 0.02,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
