import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color blushPink = Color(0xFFFAD4E8);
  static const Color airyBlue = Color(0xFF7AC9FF);
  static const Color midnight = Color(0xFF2D2A3A);

  static ThemeData buildTheme() {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: blushPink,
      colorScheme: base.colorScheme.copyWith(
        primary: airyBlue,
        secondary: midnight,
        surface: Colors.white,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.crimsonPro(
          fontWeight: FontWeight.w600,
          color: midnight,
        ),
        bodyLarge: GoogleFonts.figtree(
          fontSize: 16,
          color: midnight,
        ),
        bodyMedium: GoogleFonts.figtree(
          fontSize: 14,
          color: midnight,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white.withOpacity(0.95),
        foregroundColor: midnight,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: GoogleFonts.crimsonPro(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: midnight,
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
    );
  }
}
