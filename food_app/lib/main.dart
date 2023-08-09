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

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      filterData = filters;

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
          '/': (ctx) => TabScreen(),
          MealsScreen.routeName: (ctx) => MealsScreen(_availableMeals),
          MealDetails.routeName: (ctx) => MealDetails(),
          FilterScreen.routeName: (ctx) =>
              FilterScreen(saveFilters: _setFilters)
        });
  }
}
