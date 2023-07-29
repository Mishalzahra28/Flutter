import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String description;
  final String imageURL;
  final Color color;
  const Category(
      {required this.id,
      required this.title,
      this.color = Colors.orange,
      required this.description,
      required this.imageURL});
}
