// ignore_for_file: file_names, use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/catalog.dart';
import 'package:flutter_application_1/pages/home_detail_pages.dart';
import 'package:flutter_application_1/widgets/home_widgets/Catalog_image.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_tocart.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeDetailpages(catalog: catalog),
                        ),
                      ),
                  child: Catalogitem(catalog: catalog));
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeDetailpages(catalog: catalog),
                        ),
                      ),
                  child: Catalogitem(catalog: catalog));
            },
          );
  }
}

class Catalogitem extends StatelessWidget {
  final Item catalog;

  const Catalogitem({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image)),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            5.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\₹${catalog.price}".text.bold.make(),
                Addtocart(catalog: catalog)
              ],
            ).pOnly(right: 6.0)
          ],
        ).p(context.isMobile ? 4 : 16),
      )
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(
                    children: children2,
                  ))
        .white
        .roundedSM
        .square(130)
        .make()
        .py16();
  }
}
