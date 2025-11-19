import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color blushPink = Color(0xFFFAD4E8);
  static const Color airyBlue = Color(0xFF7AC9FF);
  static const Color midnight = Color(0xFF2D2A3A);

  static ThemeData buildTheme() {
    final base = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: airyBlue,
      brightness: Brightness.light,
    );

    final textTheme = TextTheme(
      displayLarge: GoogleFonts.crimsonPro(
        fontWeight: FontWeight.w600,
        color: midnight,
      ),
      titleLarge: GoogleFonts.crimsonPro(
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
    );

    final mergedScheme = base.colorScheme.copyWith(
      primary: airyBlue,
      secondary: midnight,
      surface: Colors.white,
      background: blushPink,
    );

    return base.copyWith(
      scaffoldBackgroundColor: blushPink,
      colorScheme: mergedScheme,
      textTheme: base.textTheme.merge(textTheme),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        foregroundColor: midnight,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: GoogleFonts.crimsonPro(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: midnight,
        ),
      ),
      cardTheme: base.cardTheme.copyWith(
        color: Colors.white,
        elevation: 4,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
      ),
    );
  }
}
