import "package:flutter/material.dart";

import "../models/place.dart";

class GreatPlaceProvider with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }
}
