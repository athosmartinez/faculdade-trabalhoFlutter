import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  primaryColor: Colors.red,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: Colors.red),
  fontFamily: "Cambay",
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 20),
    bodyLarge: TextStyle(fontSize: 28),
  ),
);
