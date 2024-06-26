import './components/button.dart';
import './components/list_items.dart';
import 'package:flutter/material.dart';
import './components/bottom_navigation.dart';
import './components/app_bar_interna.dart';
import '../screens/components/drawer.dart';

class CozinheiroScreen extends StatefulWidget {
  const CozinheiroScreen({super.key});

  @override
  State<CozinheiroScreen> createState() => _CozinheiroScreenState();
}

class _CozinheiroScreenState extends State<CozinheiroScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: MyAppBar(title: 'Pedidos'),
        drawer: DrawerScreen(),
        body: SingleChildScrollView(
          child: Pedidos(role: UserRole.cozinheiro), // Passa UserRole.cozinheiro
        ),
        bottomNavigationBar: BottomNavigation(
          param1: ParamBottomNavigation(
              label: "Pedidos",
              icon: Icons.list_alt,
              route: "CozinheiroScreen"),
          param2: ParamBottomNavigation(
              label: "Perfil", icon: Icons.person, route: "perfilGarcomScreen"),
        ));
  }
}

class Pedidos extends StatefulWidget {
  final UserRole role;

  const Pedidos({super.key, required this.role});

  @override
  State<Pedidos> createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Pedidos em andamento '),
          ListItems(role: widget.role), // Passa UserRole.cozinheiro
          const SizedBox(height: 20),
          const Text('Pedidos Finalizados'),
          ListItems(role: widget.role), // Passa UserRole.cozinheiro
        ],
      ),
    );
  }
}
