import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: false,
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Colors.grey[300],
    textTheme: GoogleFonts.latoTextTheme(),
  );
}
