import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/screens/inicial_screen.dart';
import 'package:trabalhofaculdade_flutter/screens/pedidos_garcom_screen.dart';
import 'package:trabalhofaculdade_flutter/themes/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      initialRoute: "inicialScreen",
      routes: {
        "inicialScreen": (context) => const InicialScreen(),
        "pedidosGarcomScreen": (context) => const PedidosGarcomScreen(),
      },
    );
  }
}
