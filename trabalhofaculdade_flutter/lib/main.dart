import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/supabase/config.dart';
import 'package:trabalhofaculdade_flutter/themes/my_theme.dart';
import 'package:trabalhofaculdade_flutter/screens/inicial_screen.dart';
import 'package:trabalhofaculdade_flutter/screens/pedidos_garcom_screen.dart';
import 'package:trabalhofaculdade_flutter/screens/profile_screen.dart';
import 'package:trabalhofaculdade_flutter/screens/tables_screen.dart';
import 'package:trabalhofaculdade_flutter/screens/chef_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configSupabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      initialRoute: "inicialScreen",
      routes: {
        "inicialScreen": (context) => const InicialScreen(),
        "pedidosGarcomScreen": (context) => const PedidosGarcomScreen(),
        "perfilGarcomScreen": (context) => const EditProfileScreen(),
        "mesasScreen": (context) => const TablesScreen(),
        "cozinheiroScreen": (context) => const CozinheiroScreen(),
      },
    );
  }
}
