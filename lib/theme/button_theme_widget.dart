import 'package:flutter/material.dart';

class MyButtonTheme extends TextButtonThemeData {
  final Color? backgroundColor;
  final Color? foregroundColor;
  const MyButtonTheme(
      {required this.backgroundColor, required this.foregroundColor});

  @override
  ButtonStyle? get style => ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        foregroundColor: MaterialStatePropertyAll(foregroundColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      );
}
