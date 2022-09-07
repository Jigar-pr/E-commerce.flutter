// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, unused_import, avoid_print, avoid_typevar arameter_names, sort_child_properties_last, unnecessary_null_comparison, unused_local_variable, avoid_web_libraries_in_flutter, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/Core/Store.dart';
import 'package:flutter_application_1/pages/cartmodel.dart';
import 'package:flutter_application_1/pages/catalog.dart';
import 'package:flutter_application_1/utils/routs.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_widgets/Catalog_header.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalogList.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:flutter_application_1/widgets/themes.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final Response = await http.get(Uri.parse(url));
    //final catalogjson = Response.body;
    var catalogjson = await rootBundle.loadString("assets/files/product.json");
    var decodedata = jsonDecode(catalogjson);
    var productData = decodedata["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: Mytheme.creamecolor,
      floatingActionButton: VxBuilder(
        mutations: {Addmutation, Removemutation},
        builder: (BuildContext context, store, VxStatus? status) =>
            FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, Myrouts.cartlRoute),
          child: Icon(CupertinoIcons.cart),
        ).badge(
                color: Color.fromARGB(255, 226, 211, 211),
                size: 22,
                count: _cart.items.length,
                textStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Catalogheader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py12().expand()
              else
                CircularProgressIndicator().centered().py16().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
