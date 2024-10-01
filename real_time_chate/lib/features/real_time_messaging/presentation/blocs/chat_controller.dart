import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList messages = [].obs;

  void sendMessage(String message, String userId) async {
    if (message.isNotEmpty) {
      await _firestore.collection('messages').add({
        'text': message,
        'userId': userId,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  Stream<QuerySnapshot> getMessages() {
    return _firestore.collection('messages').orderBy('timestamp').snapshots();
  }
  void updateTypingStatus(String chatId, String userId, bool isTyping) async {
  await FirebaseFirestore.instance.collection('chats').doc(chatId).update({
    'typing': {
      userId: isTyping,
    },
  });
}

}
