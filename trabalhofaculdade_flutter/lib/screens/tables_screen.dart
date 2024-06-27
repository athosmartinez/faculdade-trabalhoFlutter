import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/model/add_table.dart';
import 'package:trabalhofaculdade_flutter/supabase/tables.dart';
import 'package:trabalhofaculdade_flutter/screens/components/drawer.dart';
import 'package:trabalhofaculdade_flutter/screens/components/app_bar_interna.dart';
import 'package:trabalhofaculdade_flutter/screens/components/bottom_navigation.dart';

class TablesScreen extends StatefulWidget {
  const TablesScreen({super.key});

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> {
  List<String> tables = [];

  Future<void> _addTable(BuildContext context) async {
    TableModel newTable = TableModel();
    bool? isAdded = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Mesa'),
          content: TextField(
            controller: newTable.number,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Número da Mesa'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (newTable.number.text.isNotEmpty) {
                  Navigator.pop(context, true);
                }
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );

    if (isAdded ?? false) {
      try {
        await addTable(newTable.number.text);
        setState(() {
          tables.add(newTable.number.text);
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  Future<void> _deleteTable(String tableNumber) async {
    try {
      await deleteTable(tableNumber);
      setState(() {
        tables.remove(tableNumber);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadTables();
  }

  Future<void> _loadTables() async {
    List<String> loadedTables = await fetchTables();
    setState(() {
      tables = loadedTables;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Mesas'),
      drawer: const DrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2,
                ),
                itemCount: tables.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.green,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            tables[index],
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white),
                            onPressed: () => _deleteTable(tables[index]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => _addTable(context),
                child: const Text('Adicionar Mesa'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, 
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20), 
                  textStyle: const TextStyle(fontSize: 18), 
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(
        param1: ParamBottomNavigation(
          label: "Pedidos",
          icon: Icons.list_alt,
          route: "pedidosGarcomScreen",
        ),
        param2: ParamBottomNavigation(
          label: "Perfil",
          icon: Icons.person,
          route: "perfilGarcomScreen",
        ),
      ),
    );
  }
}
