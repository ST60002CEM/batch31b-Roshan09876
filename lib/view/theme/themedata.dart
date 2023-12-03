import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      useMaterial3: false,
      primarySwatch: Colors.blueGrey,
      scaffoldBackgroundColor: Colors.grey[300],
      textTheme: GoogleFonts.latoTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.red)));
}
