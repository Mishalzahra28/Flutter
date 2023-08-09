import 'package:flutter/material.dart';

import "../dummy_data.dart";

class MealDetails extends StatelessWidget {
  static const routeName = '/meal-detial';
  const MealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedMeal.title,
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.network(
                    selectedMeal.imageURL,
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    top: 350,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedMeal.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.left,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(children: [
                                      const Icon(Icons.schedule),
                                      const SizedBox(width: 6),
                                      Text('${selectedMeal.duration} min'),
                                    ]),
                                  ]),
                              const Icon(Icons.bookmark)
                            ]),
                      ),
                    ),
                  )
                ],
              ),
              // const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ingredients",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: selectedMeal.ingredients
                                .map((index) => Text(index))
                                .toList()),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Steps",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: selectedMeal.steps
                                .map((index) => Text(index))
                                .toList()),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
