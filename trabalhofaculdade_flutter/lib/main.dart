import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/screens/login_screen.dart';
import 'package:trabalhofaculdade_flutter/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "loginScreen",
      routes: {
        "loginScreen": (context) =>  LoginScreen(),
        "registerScreen": (context) => RegisterScreen(),
      },
    );
  }
}
