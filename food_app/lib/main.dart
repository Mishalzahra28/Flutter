import 'package:flutter/material.dart';
import "./screens/categories_screen.dart";
import './screens/category_meals_screen.dart';
import './screens/meal_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
          '/': (ctx) => CategoriesScreen(),
          MealsScreen.routeName: (ctx) => MealsScreen(),
          MealDetails.routeName: (ctx) => MealDetails()
        });
  }
}
