import 'package:flutter/material.dart';

import "./widgets/transaction_list.dart";
import "./widgets/new_transactions.dart";

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Planner"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Card(
              child: Container(
            width: double.infinity,
            child: Text("Chart"),
          )),
          NewTransaction(),
          TrasnactionList()
        ],
      ),
    );
  }
}
