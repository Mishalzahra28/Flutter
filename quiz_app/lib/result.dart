import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final VoidCallback reset;
  const Result({super.key, required this.finalScore, required this.reset});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You did it!",
            style: TextStyle(fontSize: 20),
          ),
          Text("Your score is $finalScore/5", style: TextStyle(fontSize: 20)),
          ElevatedButton(onPressed: reset, child: Text("Reset Quiz"))
        ],
      ),
    );
  }
}
