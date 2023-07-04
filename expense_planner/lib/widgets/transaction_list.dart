import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import "../models/transaction.dart";

class TrasnactionList extends StatefulWidget {
  const TrasnactionList({super.key});

  @override
  State<TrasnactionList> createState() => _TrasnactionListState();
}

class _TrasnactionListState extends State<TrasnactionList> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t2",
        title: "Weekly Groceries",
        amount: 16.53,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransactions.map((txt) {
        return Card(
            child: Row(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\$${txt.amount}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 20),
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  DateFormat.yMMMMd().add_jm().format(txt.date),
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                )
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
