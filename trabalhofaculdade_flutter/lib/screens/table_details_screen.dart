import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/screens/components/button.dart';
import 'package:trabalhofaculdade_flutter/screens/components/list_items.dart';
import 'package:trabalhofaculdade_flutter/screens/components/list_items_table.dart';
import 'package:trabalhofaculdade_flutter/screens/observations_screen.dart';

class TableDetailsScreen extends StatelessWidget {
  final String tableNumber;

  const TableDetailsScreen({Key? key, required this.tableNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mesa - $tableNumber'),
      ),
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
                  MaterialPageRoute(
                      builder: (context) => const ObservationsScreen()),
                );
              },
            ),
            Button(title: 'Fazer Pedido', isFull: true),
          ],
        ),
      ),
    );
  }
}
