import 'package:flutter/material.dart';

import "../components/main_drawer.dart";

class FilterScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function saveFilters;
  const FilterScreen({super.key, required this.saveFilters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

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
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child: const Text(
                  "Adjust your meal selection",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            // Expanded(

            // child:
            ListView(
              shrinkWrap: true,
              children: [
                SwitchListTile(
                  value: _glutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  title: Text("Gluten-Free"),
                  subtitle: Text("Only include gluten-free meals"),
                ),
                SwitchListTile(
                  value: _vegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  title: Text("Vegetarian"),
                  subtitle: Text("Only include Vegetarian meals"),
                ),
                SwitchListTile(
                  value: _vegan,
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  title: Text("Vegan"),
                  subtitle: Text("Only include Vegan meals"),
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  title: Text("Lactose-Free"),
                  subtitle: Text("Only include lactose-free meals"),
                ),
              ],
            ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown.shade400),
                      onPressed: () {
                        final selectedFilters = {
                          "gluten": _glutenFree,
                          "vegetarian": _vegetarian,
                          "vegan": _vegan,
                          "lactose": _lactoseFree
                        };
                        widget.saveFilters(selectedFilters) as Function()?;
                      },
                      child: const Text(
                        "Apply",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            )
          ],
        ));
  }
}
