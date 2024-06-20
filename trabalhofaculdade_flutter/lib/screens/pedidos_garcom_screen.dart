import './components/button.dart';
import './components/list_items.dart';
import 'package:flutter/material.dart';
import './components/bottom_navigation.dart';
import './components/app_bar_interna.dart';
import '../screens//components/drawer.dart';

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
          child: Pedidos(),
        ),
        bottomNavigationBar: BottomNavigation(
          param1: ParamBottomNavigation(
              label: "Pedidos",
              icon: Icons.list_alt,
              route: "pedidosGarcomScreen"
          ),
          param2: ParamBottomNavigation(
              label: "Perfil",
              icon: Icons.person,
              route: "perfilGarcomScreen"
          ),
        ));
  }
}

class Pedidos extends StatefulWidget {
  const Pedidos({super.key});

  @override
  State<Pedidos> createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Prontos para a entrega'),
          ListItems(),
          SizedBox(height: 20),
          Text('Pedidos entregues'),
          ListItems(),
          SizedBox(height: 20),
          Button(title: 'Novo Pedido', isFull: true),
        ],
      ),
    );
  }
}
