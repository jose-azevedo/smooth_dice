import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0xFF4EEABB);
  static Color secondaryColor = const Color(0xFF353535);

  ThemeData getThemeData() => ThemeData(
        fontFamily: 'Poppins',
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        colorScheme: ColorScheme.dark(
          primary: primaryColor,
          secondary: secondaryColor,
          onPrimary: secondaryColor,
          onSecondary: primaryColor,
        ),
        textTheme: TextTheme(
          // Applied to the AppBar's title
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
          bodyMedium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: secondaryColor,
          centerTitle: true,
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
          iconTheme: iconThemeData,
          toolbarHeight: 60,
        ),
        iconTheme: iconThemeData,
      );

  IconThemeData get iconThemeData => IconThemeData(
        color: primaryColor,
      );
}
