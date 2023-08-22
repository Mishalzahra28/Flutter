import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import "../widgets/productGrid.dart";
import '../providers/product_provider.dart';
import "../widgets/badge.dart";
import "../providers/cart.dart";
import "../screens/cart_screen.dart";
import "../widgets/appDrawer.dart";

enum FilterOption { Favorite, All }

class ProductsOverviewScreen extends StatefulWidget {
  ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _isInit = true;
  bool _isLoading = false;

  // @override
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<ProductProvider>(context)
          .getProducts()
          .then((_) => setState(() {
                _isLoading = false;
              }));
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("MyShop"),
          actions: [
            Consumer<Cart>(
              builder: (_, cart, child) =>
                  CustomBadge(value: cart.itemCount.toString(), child: child!),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  icon: Icon(Icons.shopping_cart)),
            ),
            PopupMenuButton(
                onSelected: (FilterOption selectedValue) {
                  if (selectedValue == FilterOption.Favorite) {
                    products.showFavoriteOnly();
                  } else {
                    products.showAll();
                  }
                },
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      const PopupMenuItem(
                          child: Text("Only Favorite"),
                          value: FilterOption.Favorite),
                      const PopupMenuItem(
                          child: Text("Show All"), value: FilterOption.All),
                    ])
          ],
        ),
        drawer: AppDrawer(),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ProductGrid());
  }
}
