import 'package:ChatConnect/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ChatScreenController extends GetxController {
  var senderId = FirebaseAuth.instance.currentUser!.uid;

  var chatRoomId;

  String createChatRoomId(String receiverId) {
    if (senderId.compareTo(receiverId) > 0) {
      print("$senderId sender id is greater than receiver id $receiverId");
      return "${senderId}_$receiverId";
    } else {
      print(" $receiverId receiver id is  greater than sender id $senderId");
      return "${receiverId}_$senderId";
    }
  }

  Future<void> sendMessage(String message, String receiverId) async {
    DateTime now = DateTime.now();
    String timestamp = now.toString();
    chatRoomId = createChatRoomId(receiverId);

    var uuid = Uuid();
    var chatId = uuid.v4(); // generates unique message ID

    var msg = ChatModel(
      id: chatId,
      message: message,
      senderId: senderId,
      receiverId: receiverId,
      timestamp: timestamp,
    );

    try {
      await FirebaseFirestore.instance
          .collection("chatroom")
          .doc(chatRoomId)
          .collection("messages")
          .doc(chatId)
          .set(msg.toJson());
    } catch (e) {
      print(e);
    }
  }

  Stream<List<ChatModel>> receiveMessages(String receiverId) {
    String chatRoomID = createChatRoomId(receiverId);

    return FirebaseFirestore.instance
        .collection("chatroom")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => ChatModel.fromJson(doc.data()))
                  .toList(),
        );
  }

//----------------------------------------------



}
