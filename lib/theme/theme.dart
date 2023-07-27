import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytheme{
  static ThemeData lighttheme(BuildContext context)  =>
    ThemeData(
          // primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.lato().fontFamily,
          primaryTextTheme: GoogleFonts.latoTextTheme(),
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black)
          )
          );
}