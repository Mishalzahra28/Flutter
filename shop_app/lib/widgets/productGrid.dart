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
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: ProdcutItem(),
      ),
      itemCount: loadedProducts.length,
    );
  }
}
