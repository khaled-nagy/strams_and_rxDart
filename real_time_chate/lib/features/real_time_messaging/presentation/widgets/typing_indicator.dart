import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TypingIndicator extends StatelessWidget {
  final String chatId;
  final String otherUserId;

  TypingIndicator({required this.chatId, required this.otherUserId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('chats').doc(chatId).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return SizedBox();

        var chatDoc = snapshot.data!;
        var typing = chatDoc['typing'] ?? {};

        if (typing[otherUserId] == true) {
          return Text(
            'User is typing...',
            style: TextStyle(color: Colors.grey),
          );
        }

        return SizedBox();
      },
    );
  }
}
