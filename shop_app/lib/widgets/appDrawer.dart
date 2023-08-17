import 'package:flutter/material.dart';

import "../screens/order_screen.dart";

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text("Shop App"),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text("Shop"),
          onTap: () {
            Navigator.of(context).pushReplacementNamed("/");
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text("Payments"),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
          },
        )
      ]),
    );
  }
}
