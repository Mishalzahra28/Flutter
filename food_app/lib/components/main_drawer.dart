import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 80,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Colors.orange,
          child: const Text(
            "CookItUp",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        ListTile(
          tileColor: Colors.grey.shade200,
          leading: Icon(Icons.restaurant),
          title: Text("Meals"),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        SizedBox(
          height: 5,
        ),
        ListTile(
          tileColor: Colors.grey.shade200,
          leading: Icon(Icons.settings),
          title: Text("Filters"),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/filters');
          },
        )
      ]),
    );
  }
}
