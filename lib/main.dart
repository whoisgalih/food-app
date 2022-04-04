import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission/pages/landing_page.dart';
import 'package:submission/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      theme: ThemeData(
          primaryColor: primary50,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            headline3: GoogleFonts.poppins(
                fontWeight: FontWeight.w800, fontSize: 32, color: white),
            headline4: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 20, color: black),
            subtitle1: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 16, color: black),
            subtitle2: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 14, color: black),
            bodyText2: GoogleFonts.poppins(
                fontWeight: FontWeight.w400, fontSize: 13, color: black),
          )),
      home: const LandingPage(),
    );
  }
}
