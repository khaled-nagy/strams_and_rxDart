import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String id;
  final String text;
  final String senderId;
  final Timestamp timestamp;
  final String messageType; // e.g., text, image, etc.

  MessageModel({
    required this.id,
    required this.text,
    required this.senderId,
    required this.timestamp,
    this.messageType = 'text',
  });

  // Convert Firestore document to MessageModel
  factory MessageModel.fromDocument(DocumentSnapshot doc) {
    return MessageModel(
      id: doc.id,
      text: doc['text'] ?? '',
      senderId: doc['senderId'] ?? '',
      timestamp: doc['timestamp'] ?? Timestamp.now(),
      messageType: doc['messageType'] ?? 'text',
    );
  }

  // Convert MessageModel to JSON (to store in Firestore)
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'senderId': senderId,
      'timestamp': timestamp,
      'messageType': messageType,
    };
  }
}
