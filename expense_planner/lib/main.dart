import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/chart/chart.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transactions.dart';
import "./models/transaction.dart";

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
          fontFamily: "Quicksand",
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(fontFamily: "OpenSans", fontSize: 20),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];
  bool _showCharts = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(
      String inputTitle, double inputAmount, DateTime chosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: inputTitle,
        amount: inputAmount,
        date: chosenDate);
    setState(() {
      _transactions.add(newTx);
    });
  }

  void newTransactionPopup(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(addTransaction: _addNewTransaction);
        });
  }

  void deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = mediaQuery;
    final appbar = AppBar(
      title: const Text(
        "Expense Planner",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
            onPressed: () => newTransactionPopup(context),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ))
      ],
      backgroundColor: Colors.purple,
    );

    final txListWidget = Container(
      height: (mediaQuery.size.height -
              appbar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(
          transactions: _transactions, deleteHandler: deleteTransaction),
    );
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
          child: Column(
        children: [
          if (isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Show Chart"),
                Switch(
                  value: _showCharts,
                  onChanged: (val) {
                    setState(() {
                      _showCharts = val;
                    });
                  },
                )
              ],
            ),
          if (!isLandscape)
            Container(
                height: (mediaQuery.size.height -
                        appbar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.3,
                child: Chart(recentTransactions: _recentTransactions)),
          if (!isLandscape) txListWidget,
          if (isLandscape)
            _showCharts
                ? Container(
                    height: (mediaQuery.size.height -
                            appbar.preferredSize.height -
                            mediaQuery.padding.top) *
                        0.7,
                    child: Chart(recentTransactions: _recentTransactions))
                : txListWidget
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: () => newTransactionPopup(context),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
