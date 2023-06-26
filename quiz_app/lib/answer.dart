import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback answerHandler;
  final String text;
  const Answer({super.key, required this.answerHandler, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(onPressed: answerHandler, child: Text(text)));
  }
}
