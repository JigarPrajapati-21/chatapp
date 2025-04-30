import 'package:chatapp/Congif/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chat_tile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed("/ChatPage");
          },
          child: ChatTile(
            imageUrl: AssetsImage.boyImage,
            name: 'jigar prajapati',
            lastChat: 'hiee',
            lastTime: '12.00 am',
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed("/ChatPage");
          },
          child: ChatTile(
            imageUrl: AssetsImage.boyImage,
            name: 'jigar prajapati',
            lastChat: 'hiee',
            lastTime: '12.00 am',
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed("/ChatPage");
          },
          child: ChatTile(
            imageUrl: AssetsImage.boyImage,
            name: 'jigar prajapati',
            lastChat: 'hiee',
            lastTime: '12.00 am',
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed("/ChatPage");
          },
          child: ChatTile(
            imageUrl: AssetsImage.boyImage,
            name: 'jigar prajapati',
            lastChat: 'hiee',
            lastTime: '12.00 am',
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed("/ChatPage");
          },
          child: ChatTile(
            imageUrl: AssetsImage.boyImage,
            name: 'jigar prajapati',
            lastChat: 'hiee',
            lastTime: '12.00 am',
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed("/ChatPage");
          },
          child: ChatTile(
            imageUrl: AssetsImage.boyImage,
            name: 'jigar prajapati',
            lastChat: 'hiee',
            lastTime: '12.00 am',
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed("/ChatPage");
          },
          child: ChatTile(
            imageUrl: AssetsImage.boyImage,
            name: 'jigar prajapati',
            lastChat: 'hiee',
            lastTime: '12.00 am',
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed("/ChatPage");
          },
          child: ChatTile(
            imageUrl: AssetsImage.boyImage,
            name: 'jigar prajapati',
            lastChat: 'hiee',
            lastTime: '12.00 am',
          ),
        ),
      ],
    );
  }
}
