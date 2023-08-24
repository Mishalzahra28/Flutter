import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: (ctx, index) => Container(
                padding: EdgeInsets.all(10),
                child: Text("your chat here"),
              )),
    );
  }
}
