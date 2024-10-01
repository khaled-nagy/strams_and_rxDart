import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message_model.dart';

class MessageRemoteDataSource {
  final FirebaseFirestore firestore;

  MessageRemoteDataSource(this.firestore);

 Stream<List<MessageModel>> getMessages(String chatId) {
  return FirebaseFirestore.instance
      .collection('chats')
      .doc(chatId)
      .collection('messages')
      .orderBy('timestamp')
      .snapshots()
      .map((QuerySnapshot query) {
        return query.docs.map((doc) => MessageModel.fromDocument(doc)).toList();
      });
}

  Future<void> sendMessage(MessageModel message) async {
    await firestore.collection('messages').add(message.toJson());
  }
}
