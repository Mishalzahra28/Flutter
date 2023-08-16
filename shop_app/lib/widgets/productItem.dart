import 'package:flutter/material.dart';

import "../screens/product_detail_screen.dart";

class ProdcutItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  const ProdcutItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: GestureDetector(
        onTap: () => {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routeName, arguments: title)
        },
        child: GridTile(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(
              color: Colors.amber,
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}
