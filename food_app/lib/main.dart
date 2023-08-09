import 'package:flutter/material.dart';

import "./dummy_data.dart";
import "./models/meal.dart";

import "./screens/categories_screen.dart";
import './screens/category_meals_screen.dart';
import './screens/meal_detail.dart';
import "./screens/tab_screen.dart";
import "./screens/filter_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    "gluten": false,
    "vegetarian": false,
    "vegan": false,
    "lactose": false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
  }

  bool _isFavorite(id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CookItUp',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
            useMaterial3: true,
            fontFamily: 'Raleway'),
        // home: CategoriesScreen(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabScreen(
                favoriteMeals: favoriteMeals,
              ),
          MealsScreen.routeName: (ctx) => MealsScreen(_availableMeals),
          MealDetails.routeName: (ctx) => MealDetails(
                toggleFavorite: _toggleFavorite,
                isFavorite: _isFavorite,
              ),
          FilterScreen.routeName: (ctx) =>
              FilterScreen(saveFilters: _setFilters, currentFilters: filters)
        });
  }
}
