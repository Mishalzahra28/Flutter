import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "./productItem.dart";
import '../providers/product_provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsData = Provider.of<ProductProvider>(context);
    final loadedProducts = ProductsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ProdcutItem(
          id: loadedProducts[i].id,
          title: loadedProducts[i].title,
          imageUrl: loadedProducts[i].imageUrl),
      itemCount: loadedProducts.length,
    );
  }
}
