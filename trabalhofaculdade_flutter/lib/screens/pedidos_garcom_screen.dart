import './components/button.dart';
import './components/list_items.dart';
import 'package:flutter/material.dart';
import './components/bottom_navigation.dart';
import './components/app_bar_interna.dart';
import '../screens/components/drawer.dart';

class PedidosGarcomScreen extends StatefulWidget {
  const PedidosGarcomScreen({super.key});

  @override
  State<PedidosGarcomScreen> createState() => _PedidosGarcomScreenState();
}

class _PedidosGarcomScreenState extends State<PedidosGarcomScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: MyAppBar(title: 'Pedidos'),
        drawer: DrawerScreen(),
        body: SingleChildScrollView(
          child: Pedidos(role: UserRole.garcom), // Passa UserRole.garcom
        ),
        bottomNavigationBar: BottomNavigation(
          param1: ParamBottomNavigation(
              label: "Pedidos",
              icon: Icons.list_alt,
              route: "pedidosGarcomScreen"),
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
          const Text('Em preparo'),
          ListItems(role: widget.role), // Passa UserRole.garcom
          const SizedBox(height: 20),
          const Text('Prontos para a entrega'),
          ListItems(role: widget.role), // Passa UserRole.garcom
          const SizedBox(height: 20),
          const Text('Pedidos entregues'),
          ListItems(role: widget.role), // Passa UserRole.garcom
          const SizedBox(height: 20),
          Button(title: 'Novo Pedido', isFull: true),
        ],
      ),
    );
  }
}
