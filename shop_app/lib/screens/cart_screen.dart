import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "../providers/cart.dart";
import "../widgets/cartItem.dart";
import "../providers/orders.dart";

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Cart"),
      ),
      body: Column(children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Chip(
                  label: Text(
                    '\$${cart.totalAmount}',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.orangeAccent,
                ),
                TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(), cart.totalAmount);
                      cart.clear();
                    },
                    child: const Text(
                      "Place Order",
                      style:
                          TextStyle(color: Colors.orangeAccent, fontSize: 17),
                    ))
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
              // shrinkWrap: true,
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) => CartWidget(
                  id: cart.items.values.toList()[i].id,
                  productId: cart.items.keys.toList()[i],
                  price: cart.items.values.toList()[i].price,
                  quantity: cart.items.values.toList()[i].quantity,
                  title: cart.items.values.toList()[i].title)),
        )
      ]),
    );
  }
}
