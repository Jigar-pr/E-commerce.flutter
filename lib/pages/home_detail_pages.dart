// ignore_for_file: unnecessary_null_comparison, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/catalog.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_tocart.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailpages extends StatelessWidget {
  final Item catalog;

  const HomeDetailpages({super.key, required this.catalog})
      : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\₹${catalog.price}".text.bold.xl4.make(),
            Addtocart(catalog: catalog).wh(120, 50)
          ],
        ).pOnly(right: 8.0),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(children: [
                  catalog.name.text.xl5.make(),
                  catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
                      .text
                      .textStyle(context.captionStyle)
                      .make()
                      .p16()
                ]).p32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
