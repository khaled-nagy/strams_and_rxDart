import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OnlineStatusIndicator extends StatelessWidget {
  final String userId;

  OnlineStatusIndicator({required this.userId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc(userId).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();

        var userDoc = snapshot.data!;
        String status = userDoc['status'];

        return Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: status == 'online' ? Colors.green : Colors.grey,
          ),
        );
      },
    );
  }
}
