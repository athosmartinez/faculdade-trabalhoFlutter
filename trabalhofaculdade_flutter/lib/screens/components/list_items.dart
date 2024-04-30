import 'package:flutter/material.dart';
import './button.dart';

class ListItems extends StatelessWidget{
  const ListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(right: 15),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Salada Ravanello'),
                Text('Mesa 5'),
                Button(title: 'Entregue'),
              ],
            ),
          ),
          Container(
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(right: 15),
              child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Salada Ravanello'),
                Text('Mesa 5'),
                Button(title: 'Entregue'),
              ],
            ),
          ),

        ],
      ),
    );
  }
}