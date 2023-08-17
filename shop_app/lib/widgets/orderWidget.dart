import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import "dart:math";

import "../providers/orders.dart";

class OrderWidget extends StatefulWidget {
  final OrderItem order;
  const OrderWidget({super.key, required this.order});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(children: [
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
                DateFormat('dd/MM/yyy  hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: min(widget.order.products.length * 20 + 50, 180),
              child: ListView(
                children: widget.order.products
                    .map((prod) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(prod.title),
                              Text('${prod.quantity}x'),
                              Text('price:\$${prod.price}'),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            )
        ]));
  }
}
