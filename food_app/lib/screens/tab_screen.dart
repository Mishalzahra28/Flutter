import 'package:flutter/material.dart';

import "../screens/categories_screen.dart";
import 'favorites_screen.dart';
import "../components/main_drawer.dart";
import "../models/meal.dart";

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabScreen({super.key, required this.favoriteMeals});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Widget> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      CategoriesScreen(),
      FavoriteScreen(favoriteMeals: widget.favoriteMeals)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CookItUp",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.redAccent,
          unselectedItemColor: Colors.grey.shade300,
          selectedItemColor: Colors.orange.shade300,
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.redAccent,
                icon: Icon(Icons.category),
                label: "Categories"),
            BottomNavigationBarItem(
                backgroundColor: Colors.redAccent,
                icon: Icon(Icons.star),
                label: "Saved")
          ]),
    );
  }
}
