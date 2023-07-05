import 'package:flutter/material.dart';
import "package:intl/intl.dart";

import '../../models/transaction.dart';
import "./chart-bars.dart";

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    });
  }

  double get totalSpending {
    // print(
    // "${groupedTransactionValues[6]["day"]}.................${groupedTransactionValues[0]["amount"]}.................${groupedTransactionValues[0]["day"]}");
    return groupedTransactionValues.fold(0.1, (sum, item) {
      // print("${sum + (item['amount'] as num)}_______________________________");
      return sum + (item['amount'] as num);
    });
  }

  void display() {
    print("Groupeddd:${groupedTransactionValues[0]["amount"] as double}");
    print("TOTAL SPENDING:${totalSpending}");
    print(
        "DIVISION:${(groupedTransactionValues[0]["amount"] as double) / totalSpending}");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Flexible(
              fit: FlexFit.tight,
              child: ChartBars(
                  label: (groupedTransactionValues[0]["day"] as String),
                  amount: (groupedTransactionValues[0]["amount"] as double),
                  percentage: totalSpending == 0
                      ? 0.0
                      : (groupedTransactionValues[0]["amount"] as double) /
                          totalSpending),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ChartBars(
                  label: (groupedTransactionValues[1]["day"] as String),
                  amount: (groupedTransactionValues[1]["amount"] as double),
                  percentage: totalSpending == 0
                      ? 0.0
                      : (groupedTransactionValues[1]["amount"] as double) /
                          totalSpending),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ChartBars(
                  label: (groupedTransactionValues[2]["day"] as String),
                  amount: (groupedTransactionValues[2]["amount"] as double),
                  percentage: totalSpending == 0
                      ? 0.0
                      : (groupedTransactionValues[2]["amount"] as double) /
                          totalSpending),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ChartBars(
                  label: (groupedTransactionValues[3]["day"] as String),
                  amount: (groupedTransactionValues[3]["amount"] as double),
                  percentage: totalSpending == 0
                      ? 0.0
                      : (groupedTransactionValues[3]["amount"] as double) /
                          totalSpending),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ChartBars(
                  label: (groupedTransactionValues[4]["day"] as String),
                  amount: (groupedTransactionValues[4]["amount"] as double),
                  percentage: totalSpending == 0
                      ? 0.0
                      : (groupedTransactionValues[4]["amount"] as double) /
                          totalSpending),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ChartBars(
                  label: (groupedTransactionValues[5]["day"] as String),
                  amount: (groupedTransactionValues[5]["amount"] as double),
                  percentage: totalSpending == 0
                      ? 0.0
                      : (groupedTransactionValues[5]["amount"] as double) /
                          totalSpending),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ChartBars(
                  label: (groupedTransactionValues[6]["day"] as String),
                  amount: (groupedTransactionValues[6]["amount"] as double),
                  percentage: totalSpending == 0
                      ? 0.0
                      : (groupedTransactionValues[6]["amount"] as double) /
                          totalSpending),
            ),
          ]),
        ));
  }
}
