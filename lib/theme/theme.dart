import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Color

// Primary
Color primary10 = const Color(0xFFCCE8E8);
Color primary30 = const Color(0xFF66BABA);
Color primary50 = const Color(0xFFFF4B3A);
Color primary70 = const Color(0xFF007070);
Color primary90 = const Color(0xFF004646);

// Secondary
Color secondary10 = const Color(0xFFF3E5DD);
Color secondary30 = const Color(0xFF9297A9);
Color secondary50 = const Color(0xFF49516F);
Color secondary70 = const Color(0xFF3A4159);
Color secondary90 = const Color(0xFF252938);

// Accent
Color accent10 = const Color(0xFFF3E5DD);
Color accent30 = const Color(0xFFD6A389);
Color accent50 = const Color(0xFFC57B57);
Color accent70 = const Color(0xFF8A563D);
Color accent90 = const Color(0xFF633E2C);

// Neutral
Color black = const Color(0xFF000000);
Color gray = const Color(0xFFB3B3B3);
Color white = const Color(0xFFFFFFFF);

Color border = const Color(0xFFF4F0F0);

// Fonts

// Headings
TextStyle headings(String headerLevel, [Color? colorCode]) {
  colorCode ??= black;
  Map levels = {"1": 40, "2": 32, "3": 24, "4": 20, "5": 16, "6": 14};
  return GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: levels[headerLevel].toDouble(),
    color: colorCode,
  );
}

// Title
TextStyle title(String headerLevel, [Color? colorCode]) {
  colorCode ??= black;
  Map levels = {"1": 24, "2": 20};
  return GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: levels[headerLevel].toDouble(),
    color: colorCode,
  );
}

// Subtitle
TextStyle subTitle(String headerLevel, [Color? colorCode]) {
  colorCode ??= black;
  Map levels = {"1": 20, "2": 16};
  return GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: levels[headerLevel].toDouble(),
    color: colorCode,
  );
}

// Body
TextStyle body(String headerLevel, [Color? colorCode]) {
  colorCode ??= black;
  Map levels = {"1": 16, "2": 14, "3": 12};
  return GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: levels[headerLevel].toDouble(),
    color: colorCode,
  );
}

TextStyle superTitle = GoogleFonts.poppins(
  fontWeight: FontWeight.w700,
  fontSize: 32,
  color: primary50,
);
