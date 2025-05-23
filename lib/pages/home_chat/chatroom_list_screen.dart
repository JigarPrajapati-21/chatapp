import 'package:ChatConnect/controller/chat_screen_controller.dart';
import 'package:get/get.dart';
import 'package:ChatConnect/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class ChatroomListScreen extends StatelessWidget {
  const ChatroomListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    AuthController authController=Get.put(AuthController());
    ChatScreenController chatScreenController=Get.put(ChatScreenController());

    var data = [
      {
        "name": "Aarav Patel",
        "lastMessage": "Hey, what's up?",
        "time": "10:30 AM",
        "imageUrl": "assets/images/avatar-boy-2.jpg",
      },
      {
        "name": "Meera Sharma",
        "lastMessage": "I'll call you later.",
        "time": "09:45 AM",
        "imageUrl": "assets/images/avatar-boy-2.jpg",
      },
      {
        "name": "Raj Verma",
        "lastMessage": "Did you finish the task?",
        "time": "Yesterday",
        "imageUrl": "assets/images/avatar-boy-2.jpg",
      },
      {
        "name": "Priya Joshi",
        "lastMessage": "Thank you so much!",
        "time": "11:15 AM",
        "imageUrl": "assets/images/avatar-boy-2.jpg",
      },
      {
        "name": "Karan Mehta",
        "lastMessage": "Let's meet tomorrow.",
        "time": "8:20 AM",
        "imageUrl": "assets/images/avatar-boy-2.jpg",
      },
      {
        "name": "Simran Kaur",
        "lastMessage": "Good night!",
        "time": "Yesterday",
        "imageUrl": "assets/images/avatar-boy-2.jpg",
      },
      {
        "name": "Ravi Desai",
        "lastMessage": "Where are you?",
        "time": "07:10 PM",
        "imageUrl": "assets/images/avatar-boy-2.jpg",
      },
      {
        "name": "Anjali Nair",
        "lastMessage": "Meeting at 3 PM",
        "time": "Today",
        "imageUrl": "assets/images/avatar-boy-2.jpg",
      },
      {
        "name": "Vikram Singh",
        "lastMessage": "Awesome work!",
        "time": "1:00 PM",
        "imageUrl": "assets/images/avatar-boy-2.jpg",
      },
      {
        "name": "Neha Kapoor",
        "lastMessage": "I'm on my way.",
        "time": "5:55 PM",
        "imageUrl": "assets/images/avatar-boy-2.jpg",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.deepPurple[700],
      appBar: AppBar(
        title: const Text("Chats"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[800],
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          // IconButton(onPressed: (){
          //   authController.logOut(context);
          // }, icon: Icon(Icons.logout)),

          Padding(
            padding: const EdgeInsets.only(right:  40),
            child: PopupMenuButton(
              child: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("Profile"), // menu setting
                  value: 1,
                  onTap: () {
                    Get.toNamed("/LoginUsersProfileScreen");
                  },
                ),
                PopupMenuItem(
                  child: Text("Settings"),
                  onTap: (){
                    // chatScreenController.temp();
                  },
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Logout"),
                  value: 1,
                  onTap: (){
                    authController.logOut(context);
                  },
                ),
              ],
            ),
          ),


        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.deepPurple[600],
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(data[index]['imageUrl'].toString()),
                ),
                title: Text(
                  data[index]['name'].toString(),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  data[index]['lastMessage'].toString(),
                  style: const TextStyle(color: Colors.white70),
                ),
                trailing: Text(
                  data[index]['time'].toString(),
                  style: const TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Get.toNamed("/UsersListScreen");
        },
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        child: const Icon(Icons.chat),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// class ChatroomListScreen extends StatelessWidget {
//   const ChatroomListScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var data = [
//       {
//         "name": "Aarav Patel",
//         "lastMessage": "Hey, what's up?",
//         "time": "10:30 AM",
//         "imageUrl": "assets/images/avatar-boy-2.jpg",
//       },
//       {
//         "name": "Meera Sharma",
//         "lastMessage": "I'll call you later.",
//         "time": "09:45 AM",
//         "imageUrl": "assets/images/avatar-boy-2.jpg",
//       },
//       {
//         "name": "Raj Verma",
//         "lastMessage": "Did you finish the task?",
//         "time": "Yesterday",
//         "imageUrl": "assets/images/avatar-boy-2.jpg",
//       },
//       {
//         "name": "Priya Joshi",
//         "lastMessage": "Thank you so much!",
//         "time": "11:15 AM",
//         "imageUrl": "assets/images/avatar-boy-2.jpg",
//       },
//       {
//         "name": "Karan Mehta",
//         "lastMessage": "Let's meet tomorrow.",
//         "time": "8:20 AM",
//         "imageUrl": "assets/images/avatar-boy-2.jpg",
//       },
//       {
//         "name": "Simran Kaur",
//         "lastMessage": "Good night!",
//         "time": "Yesterday",
//         "imageUrl": "assets/images/avatar-boy-2.jpg",
//       },
//       {
//         "name": "Ravi Desai",
//         "lastMessage": "Where are you?",
//         "time": "07:10 PM",
//         "imageUrl": "assets/images/avatar-boy-2.jpg",
//       },
//       {
//         "name": "Anjali Nair",
//         "lastMessage": "Meeting at 3 PM",
//         "time": "Today",
//         "imageUrl": "assets/images/avatar-boy-2.jpg",
//       },
//       {
//         "name": "Vikram Singh",
//         "lastMessage": "Awesome work!",
//         "time": "1:00 PM",
//         "imageUrl": "assets/images/avatar-boy-2.jpg",
//       },
//       {
//         "name": "Neha Kapoor",
//         "lastMessage": "I'm on my way.",
//         "time": "5:55 PM",
//         "imageUrl": "assets/images/avatar-boy-2.jpg",
//       },
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chat App"),
//         backgroundColor: Colors.blue,
//         automaticallyImplyLeading: false,
//         foregroundColor: Colors.white,
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: ListView.builder(
//           itemCount: data.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundImage: AssetImage(
//                     data[index]['imageUrl'].toString(),
//                   ),
//                 ),
//                 title: Text(data[index]['name'].toString()),
//                 subtitle: Text(data[index]['lastMessage'].toString()),
//                 trailing: Text(data[index]['time'].toString()),
//                 tileColor: Colors.blue.shade50,
//               ),
//             );
//           },
//         ),
//       ),
//
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(Icons.chat),
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.blue,
//         mini: true,
//       ),
//     );
//   }
// }
