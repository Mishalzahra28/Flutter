import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String username;
  final String imageUrl;
  const MessageBubble(
      {required Key key,
      required this.message,
      required this.isMe,
      required this.imageUrl,
      required this.username});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              child: Column(
                children: [
                  Text(username),
                  Container(
                    decoration: BoxDecoration(
                        color: isMe ? Colors.indigo : Colors.grey.shade300,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft:
                              isMe ? Radius.circular(0) : Radius.circular(15),
                          bottomRight:
                              isMe ? Radius.circular(15) : Radius.circular(0),
                        )),
                    width: 140,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Text(
                      message,
                      style:
                          TextStyle(color: isMe ? Colors.white : Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            top: 0,
            left: isMe ? null : 120,
            right: isMe ? 120 : null,
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ))
      ],
    );
  }
}
