import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction({super.key, required this.addTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;

  void submitHandler() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      return;
    }
    widget.addTransaction(enteredTitle, enteredAmount, selectedDate);
    print("Transaction added");
    Navigator.of(context).pop();
  }

  void displayDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime.now(),
    ).then((pickedDate) => {
          if (pickedDate == null)
            {selectedDate == null}
          else
            {
              setState(() {
                selectedDate = pickedDate;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                TextButton(
                    onPressed: displayDatePicker, child: Text("Choose Date")),
                Text(
                    // "No Date Chosen"
                    selectedDate == null
                        ? "No Date Chosen"
                        : DateFormat.yMd().format(selectedDate!))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: submitHandler,
                    child: const Text(
                      "Add Transaction",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
