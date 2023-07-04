import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount"),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Add Transaction",
                  style: TextStyle(color: Colors.purple, fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}
