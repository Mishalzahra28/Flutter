import 'package:flutter/material.dart';

import "./question.dart";
import "./answer.dart";

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
  void chooseAnswer() {
    setState(() {
      _Index = _Index + 1;
    });

    // print(_Index);
  }

  var questions = [
    {
      "question": "What's Capital of Pakistan?",
      "answer": ["Islamabad", "Lahore", "Karachi"]
    },
    {
      "question": "What's Capital Of Balochistan?",
      "answer": ["Sibbi", "Quetta", "Gawadar"]
    },
    {
      "question": "What's Capital Of Sindh?",
      "answer": ["Hayderabad", "Larkana", "Karachi"]
    },
    {
      "question": "What's Capital Of Punjab?",
      "answer": ["Islamabad", "Lahore", "Rawalpindi"]
    },
    {
      "question": "What's Capital Of KPK?",
      "answer": ["Peshawar", "Mardan", "DI Khan"]
    },
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('First App'),
      ),
      body: Column(
        children: [
          Question(questions[_Index]['question'] as String),
        ],
      ),
    ));
  }
}
