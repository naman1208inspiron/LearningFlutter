import 'package:flutter/material.dart';
import 'package:flutter_console/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 240, 206, 246),
      // shape: StadiumBorder(),
      child: ListTile(
        onTap: () {
          //  print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
            textScaleFactor: 1.5,
            style:
                TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
