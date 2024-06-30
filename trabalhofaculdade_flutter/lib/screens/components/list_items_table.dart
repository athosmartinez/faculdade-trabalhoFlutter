import 'package:flutter/material.dart';
import './button.dart';

class ListItemsTable extends StatelessWidget {
  const ListItemsTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Exemplo de dados
    final List<Map<String, dynamic>> items = [
      {
        "image": "pictures/food_picture.jpg",
        "name": "Salada Ravanello",
        "quantity": ["1", "2", "3", "4", "5"]
      },
      {
        "image": "pictures/food_picture.jpg",
        "name": "Salada Ravanello",
        "quantity": ["1", "2", "3", "4", "5"]
      },
      {
        "image": "pictures/food_picture.jpg",
        "name": "Salada Ravanello",
        "quantity": ["1", "2", "3", "4", "5"]
      },
      {
        "image": "pictures/food_picture.jpg",
        "name": "Salada Ravanello",
        "quantity": ["1", "2", "3", "4", "5"]
      },
      {
        "image": "pictures/food_picture.jpg",
        "name": "Salada Ravanello",
        "quantity": ["1", "2", "3", "4", "5"]
      },
    ];

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    items[index]["image"],
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(items[index]["name"],
                    style: Theme.of(context).textTheme.titleMedium),
                Button(title: 'Pedir'),
                DropdownButton<String>(
                  value: items[index]["quantity"].first,
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (String? newValue) {},
                  items: items[index]["quantity"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
