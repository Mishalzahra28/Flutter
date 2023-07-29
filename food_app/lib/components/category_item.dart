import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageURL;
  final Color color;
  const CategoryItem(
      {required this.title,
      required this.color,
      required this.description,
      required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
              colors: [color.withOpacity(0.5), color],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: ListTile(
        leading: Image.asset(
          imageURL,
          height: 50,
          width: 50,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
        subtitle: Text(description, style: TextStyle(fontSize: 10)),
      ),
    );
  }
}
