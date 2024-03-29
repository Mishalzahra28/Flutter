import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widget/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future<User>.value(FirebaseAuth.instance.currentUser!),
        builder: (ctx, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chat')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final chatDocs = snapshot.data!.docs;
                return ListView.builder(
                    reverse: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => MessageBubble(
                          message: chatDocs[index]['text'],
                          isMe: chatDocs[index]['userId'] ==
                              futureSnapshot.data!.uid,
                          key: ValueKey(chatDocs[index].id),
                          username: chatDocs[index]['username'],
                          imageUrl: chatDocs[index]['userImage'],
                        ));
              }));
        });
  }
}
