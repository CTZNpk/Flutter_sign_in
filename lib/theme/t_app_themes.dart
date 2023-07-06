import 'package:flutter/material.dart';
import 'package:sign_in/theme/button_theme_widget.dart';

class TAppTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.indigo[900],
      secondary: Colors.black,
      background: Colors.indigo[100],
      outline: Colors.white,
      onSurface: Colors.white,
      error: Colors.red[900],
    ),
    textTheme: _textTheme,
    textButtonTheme: MyButtonTheme(
      backgroundColor: Colors.indigo[900],
      foregroundColor: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xFF0d0e21),
      secondary: Colors.grey,
      background: Colors.grey[900],
      outline: Colors.grey,
      onSurface: Colors.grey,
      error: Colors.red[900],
    ),
    textTheme: _textTheme,
    textButtonTheme: MyButtonTheme(
      backgroundColor: Colors.indigo[900],
      foregroundColor: Colors.grey,
    ),
  );

  static const _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 25,
    ),
    labelLarge: TextStyle(fontSize: 14),
    displayMedium: TextStyle(fontSize: 18),
  );
}
