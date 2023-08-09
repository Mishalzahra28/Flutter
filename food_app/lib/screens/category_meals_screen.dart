import 'package:flutter/material.dart';

import '../dummy_data.dart';
import "../components/meal_item.dart";

class MealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle!,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageURL: categoryMeals[index].imageURL,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
