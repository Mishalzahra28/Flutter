import 'package:flutter/material.dart';

import "../dummy_data.dart";
import "../components/category_item.dart";

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: Offset(10, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.asset(
                            "assets/images/main_illustration.jpg"))),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                      "Delicious recipes at your fingertips - savor every bite with our food recipe app!"),
                ),
                const Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                GridView(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: DUMMY_CATEGORIES
                      .map((catData) => CategoryItem(
                            title: catData.title,
                            description: catData.description,
                            imageURL: catData.imageURL,
                            // color: catData.color,
                          ))
                      .toList(),
                ),
                // )
              ],
            ),
          ),
        ));
  }
}
