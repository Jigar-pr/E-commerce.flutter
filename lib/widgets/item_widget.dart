// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/catalog.dart';

class Itemwidget extends StatelessWidget {
  final Item item;

  const Itemwidget({super.key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: StadiumBorder(),
      child: ListTile(
        onTap: () {
          print("{item.name} pressed)");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          item.price.toString(),
          style:
              TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
