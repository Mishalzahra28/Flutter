import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import "./screens/product_detail_screen.dart";
import "./providers/product_provider.dart";
import "./providers/cart.dart";
import './screens/cart_screen.dart';
import "./providers/orders.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        // home: ProductsOverviewScreen(),
        routes: {
          "/": (context) => ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen()
        },
      ),
    );
  }
}
