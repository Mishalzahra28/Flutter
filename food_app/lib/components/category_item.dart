import 'package:flutter/material.dart';
import 'package:food_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String imageURL;
  const CategoryItem(
      {required this.title,
      required this.description,
      required this.imageURL,
      required this.id});

  void navigateHnadler(BuildContext ctx) => {
        Navigator.of(ctx).pushNamed(MealsScreen.routeName,
            arguments: {'id': id, "title": title})
      };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateHnadler(context),
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      splashColor: const Color.fromARGB(255, 250, 197, 90),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 249, 217, 151).withOpacity(0.3),
              const Color.fromARGB(255, 249, 217, 151)
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
            style: const TextStyle(fontSize: 20),
          ),
          Text(description,
              style: const TextStyle(
                fontSize: 10,
              )),
        ]),
      ),
    );
  }
}
