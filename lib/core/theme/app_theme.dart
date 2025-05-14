import 'package:flutter/material.dart';

import '../constants/app_font_family.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    fontFamily: AppFontFamily.sfProText,
    colorScheme: const ColorScheme.light(
      primary: Color(0xff0ABAB5),
    ),
  );

  static const darkColorScheme = ColorScheme.dark(
    primary: Color(0xff0ABAB5),
    onPrimary: Color(0xffF5F5F6),
    surface: Color(0xff0C111D),
    surfaceContainer: Color(0xff161B26),
    surfaceContainerHigh: Color(0xff1F242F),
    outlineVariant: Color(0xff1F242F),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: AppFontFamily.sfProText,
    scaffoldBackgroundColor: darkColorScheme.surface,
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      backgroundColor: darkColorScheme.surfaceContainer,
      titleTextStyle: TextStyle(
        fontSize: 22,
        color: darkColorScheme.onPrimary,
        fontWeight: FontWeight.w600,
        fontFamily: AppFontFamily.akrobat,
      ),
    ),
    colorScheme: darkColorScheme,
  );
}
