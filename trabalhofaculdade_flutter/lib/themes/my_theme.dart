import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  // bottomAppBarColor: Colors
  //     .green, // Usado especificamente para barras de aplicativos na parte inferior
  // scaffoldBackgroundColor:
  //     Colors.red, // Cor de fundo para a maioria dos widgets Scaffold
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
