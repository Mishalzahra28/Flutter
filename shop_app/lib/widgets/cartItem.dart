import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import "../providers/cart.dart";

class CartWidget extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  const CartWidget(
      {super.key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.productId});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 25),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: Text(
                '$quantity',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            title: Text('$title'),
            subtitle: Text('\$${price}'),
            trailing: Text('Total: \$${price * quantity}'),
          ),
        ),
      ),
    );
  }
}
