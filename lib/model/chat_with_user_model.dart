import 'package:ChatConnect/model/user_model.dart';

import 'chat_model.dart';

class ChatWithUserModel {
  final ChatModel chat;
  final UserModel user;

  ChatWithUserModel({
    required this.chat,
    required this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      'chat': chat.toJson(),
      'user': user.toJson(),
    };
  }
}
