import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const MealItem(
      {required this.title,
      required this.imageURL,
      required this.duration,
      required this.complexity,
      required this.affordability});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unkown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Expensive';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unkown';
    }
  }

  void selectMeal() {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.network(
                imageURL,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text('$duration min'),
                    ]),
                    Row(children: [
                      const Icon(Icons.workspace_premium),
                      const SizedBox(width: 6),
                      Text(complexityText),
                    ]),
                    Row(children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6),
                      Text(affordabilityText),
                    ]),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
