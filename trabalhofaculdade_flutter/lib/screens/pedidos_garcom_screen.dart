import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './components/bottom_navigation.dart';
import './components/app_bar_interna.dart';
import './components/list_items.dart';
import './components/button.dart';

class PedidosGarcomScreen extends StatefulWidget {
  const PedidosGarcomScreen({super.key});

  @override
  State<PedidosGarcomScreen> createState() => _PedidosGarcomScreenState();
}

class _PedidosGarcomScreenState extends State<PedidosGarcomScreen> {
  String? userEmail;

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  Future<void> _loadUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString('UserEmail');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(title: 'Pedidos'),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text(userEmail ?? ''),
                accountName: const Text("Garçom"),
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  child: Text("G", style: TextStyle(fontSize: 20)),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Sair", style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, 'inicialScreen',
                      (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ),
        body: const SingleChildScrollView(
          child: Pedidos(),
        ),
        bottomNavigationBar: const BottomNavigation(
            param1: ParamBottomNavigation(
                label: "Pedidos",
                icon: Icons.list_alt,
                route: "pedidosGarcomScreen"),
            param2: ParamBottomNavigation(
                label: "Perfil",
                icon: Icons.person,
                route: "perfilGarcomScreen")));
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
