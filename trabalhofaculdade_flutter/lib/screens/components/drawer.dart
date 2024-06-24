import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/model/funcao.dart'; // Importe o arquivo onde Funcao está definido
import 'package:trabalhofaculdade_flutter/util/globals.dart'; // Importe o arquivo onde user está definido

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String letter = user?.nome != null ? user!.nome.substring(0, 1) : '';

  bool isGarcom() {
    return user != null && user!.funcao == Funcao.garcom; 
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(user?.email ?? ''),
            accountName: Text(user?.nome ?? ''),
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.red,
              child: Text(
                letter,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          if (isGarcom())
            ListTile(
              leading: const Icon(Icons.table_chart),
              title: const Text("Mesas", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'mesasScreen');
              },
            ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Sair", style: TextStyle(fontSize: 18)),
            onTap: () {
              user = null;
              Navigator.pushNamedAndRemoveUntil(
                  context, 'inicialScreen', (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}