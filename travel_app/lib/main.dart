import 'package:flutter/material.dart';

import './screens/add_place_screen.dart';
import './screens/place_detail_screen.dart';
import './screens/place_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade900),
        useMaterial3: true,
      ),
      home: PlaceListScreen(),
      routes: {
        DetailScreen.routeName: (context) => DetailScreen(),
        AddPlaceScreen.routeName: (context) => AddPlaceScreen()
      },
    );
  }
}
