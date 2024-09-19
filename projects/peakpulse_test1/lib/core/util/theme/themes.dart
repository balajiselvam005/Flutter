import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peakpulse_test1/core/util/theme/color_pallete.dart';

final pallete = ColorPallete();

class AppTheme {
  static _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      );

  static final theme = ThemeData(
    textTheme: TextTheme(
      titleLarge: GoogleFonts.barlow(
        color: pallete.mainColor,
        fontSize: 42,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: GoogleFonts.barlow(
        color: pallete.mainColor,
        fontSize: 39,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: GoogleFonts.barlow(
        color: pallete.mainColor,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.barlow(
        color: pallete.mainColor,
        fontSize: 29,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.barlow(
        color: pallete.secondaryColor,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.barlow(
        color: pallete.secondaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: GoogleFonts.barlow(
        color: pallete.secondaryColor,
        fontSize: 21,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: GoogleFonts.barlow(
        color: pallete.secondaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w300,
      ),
      labelSmall: GoogleFonts.barlow(
        color: pallete.secondaryColor,
        fontSize: 19,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: GoogleFonts.barlow(
        color: pallete.secondaryColor,
        fontSize: 19,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 5, 10),
      border: _border(pallete.mainColor),
      enabledBorder: _border(pallete.secondaryColor),
      focusedBorder: _border(pallete.mainColor),
      errorBorder: _border(pallete.errorColor),
    ),
  );
}
