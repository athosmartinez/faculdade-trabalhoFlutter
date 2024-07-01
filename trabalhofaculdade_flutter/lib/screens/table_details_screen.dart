import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/screens/components/button.dart';
import 'package:trabalhofaculdade_flutter/screens/components/list_items_table.dart';
import 'package:trabalhofaculdade_flutter/screens/observations_screen.dart';
import 'package:trabalhofaculdade_flutter/screens/components/app_bar_interna.dart'; // Importando MyAppBar
import 'package:trabalhofaculdade_flutter/screens/components/drawer.dart';
import 'package:trabalhofaculdade_flutter/screens/components/bottom_navigation.dart'; // Importando BottomNavigationBar

class TableDetailsScreen extends StatefulWidget {
  final String tableNumber;

  const TableDetailsScreen({Key? key, required this.tableNumber}) : super(key: key);

  @override
  _TableDetailsScreenState createState() => _TableDetailsScreenState();
}

class _TableDetailsScreenState extends State<TableDetailsScreen> {
  int _currentIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, 'pedidosGarcomScreen');
    } else if (index == 1) {
      Navigator.pushNamed(context, 'perfilGarcomScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Mesa - ${widget.tableNumber}',
      ),
      drawer: const DrawerScreen(),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text('Pratos'),
            ListItemsTable(),
            SizedBox(height: 20),
            Button(
              title: 'Observações',
              isFull: true,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ObservationsScreen()),
                );
              },
            ),
            Button(title: 'Fazer Pedido', isFull: true),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTapped,
        backgroundColor: Colors.red,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
