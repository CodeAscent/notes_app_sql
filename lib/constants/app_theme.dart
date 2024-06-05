import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app_sql/constants/app_colors.dart';

ThemeData appTheme() => ThemeData(
    appBarTheme: AppBarTheme(
      surfaceTintColor: whiteColor(),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
      iconTheme: IconThemeData(
        size: 50,
      ),
      backgroundColor: whiteColor(),
      elevation: 0,
    ),
    useMaterial3: true,
    fontFamily: GoogleFonts.ubuntu().fontFamily,
    scaffoldBackgroundColor: whiteColor(),
    cardTheme: CardTheme(
        surfaceTintColor: whiteColor(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))));

ThemeData darkAppTheme() => ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      surfaceTintColor: blackColor(),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
      iconTheme: IconThemeData(
        size: 50,
      ),
      backgroundColor: blackColor(),
      elevation: 0,
    ),
    textTheme: TextTheme().apply(
      fontFamily: GoogleFonts.ubuntu().fontFamily,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      labelStyle: TextStyle(color: whiteColor()),
    ),
    scaffoldBackgroundColor: blackColor(),
    cardTheme: CardTheme(
        surfaceTintColor: whiteColor(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))));
