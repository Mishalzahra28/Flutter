import 'package:flutter/material.dart';

import "../widgets/productGrid.dart";

class ProductsOverviewScreen extends StatelessWidget {
  ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("MyShop")), body: ProductGrid());
  }
}
