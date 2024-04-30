import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  primaryColor: Colors.red,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
          Colors.red), // Cor de fundo global para ElevatedButtons
      foregroundColor:
          MaterialStateProperty.all<Color>(Colors.white), // Cor de texto global
    ),
  ),
  fontFamily: "Cambay",
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 20),
    bodyLarge: TextStyle(fontSize: 28),
  ),
);
