import 'package:flutter/material.dart';
import './button.dart';

enum UserRole { garcom, cozinheiro }

class ListItems extends StatelessWidget {
  final UserRole role;

  const ListItems({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildItem(context),
          _buildItem(context),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Salada Ravanello'),
          const Text('Mesa 5'),
          Button(
            title: role == UserRole.cozinheiro ? 'Visualizar' : 'Entregue',
            onPressed: () {
              if (role == UserRole.cozinheiro) {
                Navigator.pushNamed(context, 'pratoCozinheiroScreen');
              } else {
                // Lógica para garçom
              }
            },
          ),
        ],
      ),
    );
  }
}
