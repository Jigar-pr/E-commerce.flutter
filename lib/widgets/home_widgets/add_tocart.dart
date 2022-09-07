// ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers, prefer_const_constructors, duplicate_ignore, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/Store.dart';
import 'package:flutter_application_1/pages/cartmodel.dart';
import 'package:flutter_application_1/pages/catalog.dart';
import 'package:velocity_x/velocity_x.dart';


class Addtocart extends StatelessWidget {
  final Item catalog;

  Addtocart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [Addmutation, Removemutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    bool isincart = _cart.items.contains(catalog);

    return ElevatedButton(
        onPressed: () {
          if (isincart == false) {
            Addmutation(catalog);
            // setState(() {});
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),
        child:
            // ignore: prefer_const_constructors
            isincart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
