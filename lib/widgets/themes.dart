// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytheme {
  static ThemeData lightheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ));

  static ThemeData darktheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ));

  static Color creamecolor = Color.fromARGB(224, 210, 206, 206);
  static Color darkcolor = Color.fromARGB(0, 3, 3, 3);
}
