import 'package:flutter/material.dart';

import "./question.dart";
import "./answer.dart";

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int Index;
  final Function chooseAnswer;

  const Quiz(
      {super.key,
      required this.questions,
      required this.chooseAnswer,
      required this.Index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[Index]['question'] as String),
        ...(questions[Index]["answer"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              answerHandler: () => chooseAnswer(answer["score"] as int),
              text: answer["text"] as String);
        }).toList(),
      ],
    );
  }
}
