import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

import 'products.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _items = [];

  var showFavorite = false;

  Future<void> getProducts() async {
    var url = Uri.parse(
        "https://myshop-dd773-default-rtdb.firebaseio.com/products.json");
    try {
      final response = await http.get(url);
      List<Product> loadedProducts = [];
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      extractedData.forEach(
        (prodId, prodData) {
          loadedProducts.add(Product(
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            price: prodData['price'] as double,
            imageUrl: prodData['imageUrl'],
          ));
        },
      );
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  List<Product> get items {
    if (showFavorite) {
      return _items.where((item) => item.isFavorite).toList();
    }
    return [..._items];
  }

  Product getItem(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  void showFavoriteOnly() {
    showFavorite = true;
    notifyListeners();
  }

  void showAll() {
    showFavorite = false;
    notifyListeners();
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
