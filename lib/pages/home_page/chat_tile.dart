import 'package:chatapp/Congif/images.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {

  final String imageUrl;
  final String name;
  final String lastChat;
  final String lastTime;


  const ChatTile({super.key, required this.imageUrl, required this.name, required this.lastChat, required this.lastTime});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: theme.colorScheme.primaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Image.asset(imageUrl, width: 70,),

              ClipOval(
                child: Image.asset(
                  imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),


              SizedBox(width: 15),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: theme.textTheme.bodyLarge),
                  SizedBox(height: 5),
                  Text(lastChat, style: theme.textTheme.labelMedium),
                ],
              ),
            ],
          ),
          Text(lastTime, style: theme.textTheme.labelMedium),
        ],
      ),
    );
  }
}
