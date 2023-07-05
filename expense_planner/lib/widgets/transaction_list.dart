import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import "../models/transaction.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({super.key, required this.transactions});

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/waiting.png",
                  height: 200,
                  // fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text(
                  "No Expenses Yet",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
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
                      DateFormat.yMMMMd()
                          .add_jm()
                          .format(transactions[index].date),
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                );
                // return Card(
                //     child: Row(
                //   children: [
                //     Container(
                //         margin: const EdgeInsets.symmetric(
                //             vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //             border: Border.all(color: Colors.purple, width: 1)),
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Text(
                //             "\$${transactions[index].amount.toStringAsFixed(2)}",
                //             style: const TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.purple,
                //                 fontSize: 20),
                //           ),
                //         )),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           transactions[index].title,
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold, fontSize: 17),
                //         ),
                //         Text(
                //           DateFormat.yMMMMd()
                //               .add_jm()
                //               .format(transactions[index].date),
                //           style:
                //               const TextStyle(color: Colors.grey, fontSize: 14),
                //         )
                //       ],
                //     )
                //   ],
                // ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
