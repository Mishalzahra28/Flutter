import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import "../providers/orders.dart";
import "../widgets/orderWidget.dart";
import "../widgets/appDrawer.dart";

class OrderScreen extends StatefulWidget {
  static const routeName = "/orders";
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isInit = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Orders>(context).getOrders().then((_) => setState(() {
            _isLoading = false;
          }));
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: order.orders.length,
              itemBuilder: (context, index) =>
                  OrderWidget(order: order.orders[index]),
            ),
    );
  }
}
