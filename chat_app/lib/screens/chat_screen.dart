import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";

import '../widget/messages.dart';
import "../widget/new_message.dart";

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "MyChat",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          DropdownButton(
            underline: Container(),
            items: const [
              DropdownMenuItem(
                value: "logout",
                child: Row(children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Logout")
                ]),
              )
            ],
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onChanged: (value) {
              if (value == "logout") {
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
      body: const Column(children: [Expanded(child: Messages()), NewMessage()]),
    );
  }
}
