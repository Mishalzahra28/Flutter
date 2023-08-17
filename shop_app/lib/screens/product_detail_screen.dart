import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "../providers/product_provider.dart";

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product-detail";
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedItem =
        Provider.of<ProductProvider>(context, listen: false).getItem(productId);

    return Scaffold(
      appBar: AppBar(title: Text(loadedItem.title)),
      body: Column(children: [
        Container(
          child: Image.network(
            loadedItem.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '\$${loadedItem.price}',
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 5),
        Text(loadedItem.description)
      ]),
    );
  }
}
