// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/pages/cartmodel.dart';
import 'package:flutter_application_1/pages/catalog.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
