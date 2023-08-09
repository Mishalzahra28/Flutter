import 'package:flutter/material.dart';

import "../models/meal.dart";
import "../components/meal_item.dart";

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
 return Center(
      child: Text("No Favorites yet! Try adding some"),
    );
    }else{ return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageURL: favoriteMeals[index].imageURL,
                duration: favoriteMeals[index].duration,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability);
          },
          itemCount: favoriteMeals.length,
        );
    }
   
  }
}
