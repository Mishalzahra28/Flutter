import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = "detail-screen";
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        title: const Text(
          'travelLogs',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(child: Text("Place Detail Screen")),
    );
  }
}
