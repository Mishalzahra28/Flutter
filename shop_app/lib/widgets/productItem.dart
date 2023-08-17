import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "../screens/product_detail_screen.dart";
import "../providers/products.dart";
import "../providers/cart.dart";

class ProdcutItem extends StatelessWidget {
  const ProdcutItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: GestureDetector(
        onTap: () => {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routeName, arguments: product.id)
        },
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: Consumer<Product>(
              builder: (context, product, child) => IconButton(
                color: Colors.amber,
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  product.toggleFavorite();
                },
              ),
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(product.id, product.title, product.price);
              },
              color: Colors.amber,
            ),
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
