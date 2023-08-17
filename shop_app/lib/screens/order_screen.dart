import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import "../providers/orders.dart";
import "../widgets/orderWidget.dart";
import "../widgets/appDrawer.dart";

class OrderScreen extends StatelessWidget {
  static const routeName = "/orders";
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: order.orders.length,
        itemBuilder: (context, index) =>
            OrderWidget(order: order.orders[index]),
      ),
    );
  }
}
