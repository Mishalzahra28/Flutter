import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import "../models/transaction.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteHandler;
  TransactionList(
      {super.key, required this.transactions, required this.deleteHandler});
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.75,
      width: double.infinity,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: ((context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/waiting.png",
                    height: constraints.maxHeight * 0.6,
                    // fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "No Expenses Yet",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              );
            }))
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: CircleAvatar(
                          radius: 30,
                          child: Text(
                            "\$${transactions[index].amount.toStringAsFixed(2)}",
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(transactions[index].date),
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteHandler(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
