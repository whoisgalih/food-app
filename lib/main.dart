import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_app/pages/landing_page.dart';
import 'package:food_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food-app',
      theme: ThemeData(
          primaryColor: primary50,
          scaffoldBackgroundColor: const Color(0xFFF9F9F9),
          textTheme: TextTheme(
            displaySmall: GoogleFonts.poppins(
                fontWeight: FontWeight.w800, fontSize: 32, color: white),
            headlineMedium: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 20, color: black),
            titleMedium: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 16, color: black),
            titleSmall: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 14, color: black),
            bodyMedium: GoogleFonts.poppins(
                fontWeight: FontWeight.w400, fontSize: 13, color: black),
          )),
      home: const LandingPage(),
    );
  }
}
