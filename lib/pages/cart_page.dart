// ignore_for_file: prefer_const_constructors, unused_element, deprecated_member_use, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:pay/pay.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/Core/Store.dart';
import 'package:flutter_application_1/pages/cartmodel.dart';
import 'package:flutter_application_1/widgets/themes.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mytheme.creamecolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.black.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _paymentItems = <PaymentItem>[];
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {Removemutation},
            builder: (BuildContext context, store, VxStatus? status) {
              _paymentItems.add(PaymentItem(
                amount: _cart.totalprice.toString(),
                label: "Codepur Cpourse",
                status: PaymentItemStatus.final_price,
              ));
              return "₹${_cart.totalprice}"
                  .text
                  .xl4
                  .color(context.theme.accentColor)
                  .make();
            },
          ),
          30.widthBox,
          Row(
            children: [
              GooglePayButton(
                paymentConfigurationAsset: 'gpay.json',
                paymentItems: _paymentItems,
                width: 200,
                height: 50,
                style: GooglePayButtonStyle.black,
                type: GooglePayButtonType.pay,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: (data) {
                  print(data);
                },
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          )

          // ElevatedButton(
          //     onPressed: () {
          //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //           content: "Buying is not supported yet.".text.make()));
          //     },
          //     child: "Buy".text.center.white.make().w20(context))
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [Removemutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Cart is Empty".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (Context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () => Removemutation(_cart.items[index]),
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
