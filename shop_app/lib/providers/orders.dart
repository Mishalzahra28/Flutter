import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final timestamp = DateTime.now();
    var url = Uri.parse(
        "https://myshop-dd773-default-rtdb.firebaseio.com/orders.json");
    final response = await http.post(url,
        body: jsonEncode({
          "amount": total,
          "dateTime": timestamp.toIso8601String(),
          "products": cartProducts
              .map((cp) => {
                    "id": cp.id,
                    "title": cp.title,
                    "quantity": cp.quantity,
                    "price": cp.price
                  })
              .toList(),
        }));
    _orders.insert(
        0,
        OrderItem(
            id: jsonDecode(response.body)['name'],
            amount: total,
            products: cartProducts,
            dateTime: timestamp));
  }

  Future<void> getOrders() async {
    var url = Uri.parse(
        "https://myshop-dd773-default-rtdb.firebaseio.com/orders.json");
    try {
      final response = await http.get(url);
      List<OrderItem> loadedProducts = [];
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach(
        (ordId, ordData) {
          loadedProducts.add(OrderItem(
              id: ordId,
              amount: ordData['amount'],
              dateTime: DateTime.parse(ordData['dateTime']),
              products: (ordData['products'] as List<dynamic>)
                  .map((prod) => CartItem(
                      id: prod["id"],
                      title: prod["title"],
                      quantity: prod["quantity"],
                      price: prod["price"]))
                  .toList()));
        },
      );
      _orders = loadedProducts.reversed.toList();
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
