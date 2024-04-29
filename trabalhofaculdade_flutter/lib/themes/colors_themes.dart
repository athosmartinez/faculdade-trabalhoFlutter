import 'package:flutter/material.dart';

class ThemeColors {
  static const MaterialColor primaryColor = Colors.purple;
  static const List<Color> headerGradient = [
    Color.fromRGBO(12, 5, 235, 1),
    Color.fromRGBO(50, 4, 142, 1),
    Color.fromRGBO(2, 8, 73, 1)
  ];
  static const Map<String, Color> recentActivity = {
    'spent': Color.fromRGBO(255, 175, 29, 1),
    'income': Color.fromRGBO(191, 69, 198, 1)
  };

  static const Map<String, Color> accountPoints = {
    'first': Color.fromRGBO(250, 0, 112, 1),
    'second': Color.fromRGBO(75, 89, 191, 1)
  };

  static const divisonColor = Color.fromRGBO(166, 166, 166, 1);
}
