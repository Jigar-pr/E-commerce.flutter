// ignore_for_file: file_names, use_key_in_widget_constructors, avoid_unnecessary_containers, unused_import, prefer_const_constructors

import 'package:flutter_application_1/utils/routs.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class Catalogheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "E-commerce App".text.xl4.bold.make(),
          "Trending Product".text.bold.make(),
        ],
      ),
    );
  }
}
  