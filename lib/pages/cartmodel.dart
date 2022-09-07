// ignore_for_file: unused_import, unused_element, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Core/Store.dart';
import 'package:flutter_application_1/pages/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // ignore: non_constant_identifier_names
  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

}

class Addmutation extends VxMutation<MyStore> {
 final Item  item;

  Addmutation(this.item);
  @override
  perform() {
    // ignore: todo
    // TODO: implement perform
    store?.cart._itemIds.add(item.id);
  }
}


class Removemutation extends VxMutation<MyStore> {
 final Item  item;

  Removemutation(this.item);

  @override
  perform() {
    // ignore: todo
    // TODO: implement perform
    store?.cart._itemIds.remove(item.id);
  }
}
