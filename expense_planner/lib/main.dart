import 'package:flutter/material.dart';

import './result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _Index = 0;
  var _totalScore = 0;

  void chooseAnswer(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _Index = _Index + 1;
    });
  }

  void resetQuiz() {
    setState(() {
      _Index = 0;
      _totalScore = 0;
    });
  }

  var questions = [
    {
      "question": "What's Capital of Pakistan?",
      "answer": [
        {"text": "Islamabad", "score": 1},
        {"text": "Lahore", "score": 0},
        {"text": "Karachi", "score": 0}
      ]
    },
    {
      "question": "What's Capital Of Balochistan?",
      "answer": [
        {"text": "Sibbi", "score": 0},
        {"text": "Quetta", "score": 1},
        {"text": "Gawadar", "score": 0}
      ]
    },
    {
      "question": "What's Capital Of Sindh?",
      "answer": [
        {"text": "Hayderabad", "score": 0},
        {"text": "Larkana", "score": 0},
        {"text": "Karachi", "score": 1}
      ]
    },
    {
      "question": "What's Capital Of Punjab?",
      "answer": [
        {"text": "Islamabad", "score": 0},
        {"text": "Lahore", "score": 1},
        {"text": "Rawalpindi", "score": 0}
      ]
    },
    {
      "question": "What's Capital Of KPK?",
      "answer": [
        {"text": "Peshawar", "score": 1},
        {"text": "Mardan", "score": 0},
        {"text": "DI Khan", "score": 0}
      ]
    },
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('First App'),
            ),
            body: _Index < questions.length
                ? Quiz(
                    questions: questions,
                    chooseAnswer: chooseAnswer,
                    Index: _Index)
                : Result(
                    finalScore: _totalScore,
                    reset: resetQuiz,
                  )));
  }
}
