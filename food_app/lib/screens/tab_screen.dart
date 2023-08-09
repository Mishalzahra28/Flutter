import 'package:flutter/material.dart';

import "../screens/categories_screen.dart";
import "../screens/saved_screen.dart";
import "../components/main_drawer.dart";

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _pages = const [CategoriesScreen(), SavedScreen()];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
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
                icon: Icon(Icons.bookmark_added),
                label: "Saved")
          ]),
    );
  }
}
