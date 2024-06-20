import 'package:flutter/material.dart';

void messageError(BuildContext context, String message) {
  _showMessage(context, message, Colors.red);
}

void messageSuccess(BuildContext context, String message) {
  _showMessage(context, message, Colors.green);
}

void _showMessage(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
  ));
}
