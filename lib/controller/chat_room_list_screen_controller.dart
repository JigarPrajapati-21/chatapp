import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../model/chat_model.dart';
import '../model/chat_with_user_model.dart';
import '../model/user_model.dart';

class ChatRoomListScreenController extends GetxController {

  final currentUserId = FirebaseAuth.instance.currentUser?.uid;

  Stream<List<ChatWithUserModel>> chatStream() {
    // final currentUserId = FirebaseAuth.instance.currentUser?.uid;

    if (currentUserId == null) {
      print("User not logged in.");
      // Return an empty stream that immediately closes
      return Stream.value([]);
    }

    // Listen to Firestore snapshots stream
    return FirebaseFirestore.instance
        .collectionGroup("chatroom")
        .snapshots()
        .asyncMap((snapshot) async {
      List<ChatWithUserModel> chatWithUsers = [];

      // Loop through each chat doc
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data();
        ChatModel chat = ChatModel.fromJson(data);

        if (chat.senderId == currentUserId || chat.receiverId == currentUserId) {
          String? otherUserId = chat.senderId == currentUserId
              ? chat.receiverId
              : chat.senderId;

          if (otherUserId != null) {
            DocumentSnapshot userDoc = await FirebaseFirestore.instance
                .collection("users")
                .doc(otherUserId)
                .get();

            if (userDoc.exists) {
              UserModel user = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
              chatWithUsers.add(ChatWithUserModel(chat: chat, user: user));
            }
          }
        }
      }

      return chatWithUsers;
    });
  }


}