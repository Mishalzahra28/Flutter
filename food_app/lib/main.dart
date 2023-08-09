import 'package:flutter/material.dart';
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

  void _setFilters(Map<String, bool> filterData) {}

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
          MealsScreen.routeName: (ctx) => MealsScreen(),
          MealDetails.routeName: (ctx) => MealDetails(),
          FilterScreen.routeName: (ctx) =>
              FilterScreen(saveFilters: _setFilters)
        });
  }
}
