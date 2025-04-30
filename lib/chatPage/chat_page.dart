import 'package:chatapp/Congif/images.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        leadingWidth: 25, // Removes default back icon space
        titleSpacing: 16,
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                AssetsImage.boyImage,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jigar Prajapati",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text("Online", style: theme.textTheme.labelSmall),
              ],
            ),
          ],
        ),
        elevation: 0.4,

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
        ],

        // backgroundColor: theme.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
