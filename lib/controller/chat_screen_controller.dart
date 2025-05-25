import 'package:ChatConnect/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../model/chat_with_user_model.dart';
import '../model/user_model.dart';

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

    //set last message in chatroom
    var lstmsg = ChatModel(
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

      // save last message in chatroom  [chatroom/{chatroomis}/lstmsg]
      await FirebaseFirestore.instance
          .collection("chatroom")
          .doc(chatRoomId)
          .set(lstmsg.toJson());

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

//this following all code is for only testing perpose to get chat room list for chatroomlistscreen

//   void temp() async {
//     try {
//       QuerySnapshot snapshot = await FirebaseFirestore.instance.collectionGroup("chatroom").get();
// print("AAAAAA");
//       print("Total documents found: ${snapshot.docs.length}");
//
//       for (var doc in snapshot.docs) {
//         print("Document ID: ${doc.id}");
//         print("Data: ${doc.data()}");
//       }
//       print("SSS");
//     } catch (e) {
//       print("Error fetching chatroom documents: $e");
//     }
//   }

  // void temp() async {
  //   List<ChatModel> lastChats = [];
  //
  //   try {
  //     // If you want to fetch all messages across all chatrooms
  //     QuerySnapshot snapshot = await FirebaseFirestore.instance
  //         .collectionGroup("chatroom")
  //         .get();
  //
  //     print("AAAAAA");
  //     print("Total documents found: ${snapshot.docs.length}");
  //
  //     for (var doc in snapshot.docs) {
  //       print("Document ID: ${doc.id}");
  //
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //       ChatModel chat = ChatModel.fromJson(data);
  //       lastChats.add(chat);
  //
  //       print(chat.toJson());
  //     }
  //
  //     print("SSS");
  //   } catch (e) {
  //     print("Error fetching messages: $e");
  //   }
  // }



  // void temp() async {
  //   List<ChatModel> lastChats = [];
  //
  //   try {
  //     final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  //
  //     if (currentUserId == null) {
  //       print("User not logged in.");
  //       return;
  //     }
  //
  //     QuerySnapshot snapshot = await FirebaseFirestore.instance
  //         .collectionGroup("chatroom")
  //         .get();
  //
  //     print("Total documents found: ${snapshot.docs.length}");
  //
  //     for (var doc in snapshot.docs) {
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //       ChatModel chat = ChatModel.fromJson(data);
  //
  //       // Add to list only if current user is sender or receiver
  //       if (chat.senderId == currentUserId || chat.receiverId == currentUserId) {
  //         lastChats.add(chat);
  //         print(chat.toJson()); // Or print(chat) if toString() is defined
  //       }
  //     }
  //
  //     print("Total chats added for user: ${lastChats.length}");
  //   } catch (e) {
  //     print("Error fetching messages: $e");
  //   }
  // }


  // void temp() async {
  //   List<ChatModel> lastChats = [];
  //
  //   try {
  //     final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  //
  //     if (currentUserId == null) {
  //       print("User not logged in.");
  //       return;
  //     }
  //
  //     QuerySnapshot snapshot = await FirebaseFirestore.instance
  //         .collectionGroup("chatroom")
  //         .get(); // Note: Use "messages" not "chatroom" to fetch actual messages
  //
  //     print("Total documents found: ${snapshot.docs.length}");
  //
  //     for (var doc in snapshot.docs) {
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //       ChatModel chat = ChatModel.fromJson(data);
  //
  //       // Add only if the current user is sender or receiver
  //       if (chat.senderId == currentUserId || chat.receiverId == currentUserId) {
  //         lastChats.add(chat);
  //
  //         // Identify the other user's ID
  //         String? otherUserId = chat.senderId == currentUserId
  //             ? chat.receiverId
  //             : chat.senderId;
  //
  //         // Fetch that user's info from "users" collection
  //         if (otherUserId != null) {
  //           DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
  //               .collection("users")
  //               .doc(otherUserId)
  //               .get();
  //
  //           if (userSnapshot.exists) {
  //             Map<String, dynamic> userData =
  //             userSnapshot.data() as Map<String, dynamic>;
  //
  //             print("Other User Info:");
  //             print("Name: ${userData['name']}");
  //             print("Email: ${userData['email']}");
  //             // Add more fields if needed
  //           } else {
  //             print("User document not found for ID: $otherUserId");
  //           }
  //         }
  //
  //         print("Chat: ${chat.toJson()}");
  //       }
  //     }
  //
  //     print("Total chats added for user: ${lastChats.length}");
  //   } catch (e) {
  //     print("Error fetching messages: $e");
  //   }
  // }


  // void temp() async {
  //   List<ChatModel> lastChats = [];
  //   List<UserModel> otherUsers = [];
  //
  //   try {
  //     final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  //
  //     if (currentUserId == null) {
  //       print("User not logged in.");
  //       return;
  //     }
  //
  //     // Fetch all messages from "messages" subcollections under any chatroom
  //     QuerySnapshot snapshot = await FirebaseFirestore.instance
  //         .collectionGroup("chatroom")
  //         .get();
  //
  //     print("Total messages found: ${snapshot.docs.length}");
  //
  //     for (var doc in snapshot.docs) {
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //       ChatModel chat = ChatModel.fromJson(data);
  //
  //       // Check if current user is sender or receiver
  //       if (chat.senderId == currentUserId || chat.receiverId == currentUserId) {
  //         lastChats.add(chat);
  //
  //         // Identify the other user
  //         String? otherUserId = chat.senderId == currentUserId
  //             ? chat.receiverId
  //             : chat.senderId;
  //
  //         if (otherUserId != null) {
  //           DocumentSnapshot userDoc = await FirebaseFirestore.instance
  //               .collection("users")
  //               .doc(otherUserId)
  //               .get();
  //
  //           if (userDoc.exists) {
  //             UserModel user =
  //             UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
  //             otherUsers.add(user);
  //
  //             print("Other User: ${user.name}, Email: ${user.email}");
  //           } else {
  //             print("No user found with ID: $otherUserId");
  //           }
  //         }
  //
  //         print("Chat: ${chat.toJson()}");
  //       }
  //     }
  //
  //     print("Total chats: ${lastChats.length}");
  //     print("Total other users fetched: ${otherUsers.length}");
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }

  // void temp() async {
  //   List<ChatWithUserModel> chatWithUsers = [];
  //
  //   try {
  //     final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  //
  //     if (currentUserId == null) {
  //       print("User not logged in.");
  //       return;
  //     }
  //
  //     QuerySnapshot snapshot = await FirebaseFirestore.instance
  //         .collectionGroup("chatroom")
  //         .get();
  //
  //     print("Total messages found: ${snapshot.docs.length}");
  //
  //     for (var doc in snapshot.docs) {
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //       ChatModel chat = ChatModel.fromJson(data);
  //
  //       // Only proceed if current user is part of the chat
  //       if (chat.senderId == currentUserId || chat.receiverId == currentUserId) {
  //         String? otherUserId = chat.senderId == currentUserId
  //             ? chat.receiverId
  //             : chat.senderId;
  //
  //         if (otherUserId != null) {
  //           DocumentSnapshot userDoc = await FirebaseFirestore.instance
  //               .collection("users")
  //               .doc(otherUserId)
  //               .get();
  //
  //           if (userDoc.exists) {
  //             UserModel user = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
  //             chatWithUsers.add(ChatWithUserModel(chat: chat, user: user));
  //
  //             print("✅ Chat with ${user.name}: ${chat.message}");
  //           }
  //         }
  //       }
  //     }
  //
  //     print("✅ Total chats with users: ${chatWithUsers.length}");
  //   } catch (e) {
  //     print("❌ Error fetching chats and users: $e");
  //   }
  // }



  //
  // void temp() async {
  //   List<ChatWithUserModel> chatWithUsers = [];
  //
  //   try {
  //     final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  //
  //     if (currentUserId == null) {
  //       print("User not logged in.");
  //       return;
  //     }
  //
  //     QuerySnapshot snapshot = await FirebaseFirestore.instance
  //         .collectionGroup("chatroom")
  //         .get();
  //
  //     print("Total messages found: ${snapshot.docs.length}");
  //
  //     for (var doc in snapshot.docs) {
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //       ChatModel chat = ChatModel.fromJson(data);
  //
  //       // Only proceed if current user is sender or receiver
  //       if (chat.senderId == currentUserId || chat.receiverId == currentUserId) {
  //         String? otherUserId = chat.senderId == currentUserId
  //             ? chat.receiverId
  //             : chat.senderId;
  //
  //         if (otherUserId != null) {
  //           DocumentSnapshot userDoc = await FirebaseFirestore.instance
  //               .collection("users")
  //               .doc(otherUserId)
  //               .get();
  //
  //           if (userDoc.exists) {
  //             UserModel user = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
  //             chatWithUsers.add(ChatWithUserModel(chat: chat, user: user));
  //           }
  //         }
  //       }
  //     }
  //
  //     // ✅ Print full details
  //     for (var item in chatWithUsers) {
  //       print("===== Chat With User =====");
  //       print("User ID      : ${item.user.id}");
  //       print("Name         : ${item.user.name}");
  //       print("Email        : ${item.user.email}");
  //       print("Phone Number : ${item.user.phoneNumber}");
  //       print("Profile Img  : ${item.user.profileImage}");
  //       print("Online Status: ${item.user.onlineStatus}");
  //       print("---- Chat Info ----");
  //       print("Message ID   : ${item.chat.id}");
  //       print("Message      : ${item.chat.message}");
  //       print("Sender ID    : ${item.chat.senderId}");
  //       print("Receiver ID  : ${item.chat.receiverId}");
  //       print("Timestamp    : ${item.chat.timestamp}");
  //       print("Read Status  : ${item.chat.readStatus}");
  //       print("Image URL    : ${item.chat.imageUrl}");
  //       print("Video URL    : ${item.chat.videoUrl}");
  //       print("Audio URL    : ${item.chat.audioUrl}");
  //       print("Document URL : ${item.chat.documentUrl}");
  //       print("=========================\n");
  //     }
  //   } catch (e) {
  //     print("❌ Error fetching chats and users: $e");
  //   }
  // }



  // Stream<List<ChatWithUserModel>> chatStream() {
  //   final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  //
  //   if (currentUserId == null) {
  //     print("User not logged in.");
  //     // Return an empty stream that immediately closes
  //     return Stream.value([]);
  //   }
  //
  //   // Listen to Firestore snapshots stream
  //   return FirebaseFirestore.instance
  //       .collectionGroup("chatroom")
  //       .snapshots()
  //       .asyncMap((snapshot) async {
  //     List<ChatWithUserModel> chatWithUsers = [];
  //
  //     // Loop through each chat doc
  //     for (var doc in snapshot.docs) {
  //       Map<String, dynamic> data = doc.data();
  //       ChatModel chat = ChatModel.fromJson(data);
  //
  //       if (chat.senderId == currentUserId || chat.receiverId == currentUserId) {
  //         String? otherUserId = chat.senderId == currentUserId
  //             ? chat.receiverId
  //             : chat.senderId;
  //
  //         if (otherUserId != null) {
  //           DocumentSnapshot userDoc = await FirebaseFirestore.instance
  //               .collection("users")
  //               .doc(otherUserId)
  //               .get();
  //
  //           if (userDoc.exists) {
  //             UserModel user = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
  //             chatWithUsers.add(ChatWithUserModel(chat: chat, user: user));
  //           }
  //         }
  //       }
  //     }
  //
  //     return chatWithUsers;
  //   });
  // }





}
