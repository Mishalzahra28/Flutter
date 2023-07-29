import 'dart:math';

import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageURL;
  // final Color color;
  const CategoryItem(
      {required this.title,
      // this.color = Color.fromARGB(255, 11, 72, 66),
      required this.description,
      required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 249, 217, 151).withOpacity(0.3),
            Color.fromARGB(255, 249, 217, 151)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            imageURL,
            height: 50,
            width: 50,
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        Text(description,
            style: TextStyle(
              fontSize: 10,
            )),
      ]),
    );
  }
}
