import 'package:ChatConnect/controller/users_contact_list_controller.dart';
import 'package:ChatConnect/pages/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersContactListScreen extends StatefulWidget {
  const UsersContactListScreen({super.key});

  @override
  State<UsersContactListScreen> createState() => _UsersContactListScreenState();
}

class _UsersContactListScreenState extends State<UsersContactListScreen> {
  UsersContactListController usersContactListController = Get.put(
    UsersContactListController(),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersContactListController.getAllUsersContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[700],

      appBar: AppBar(
        title: Text("Select user contact", style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.deepPurple[800],
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              color: Colors.deepPurple[600],
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: CircleAvatar(child: Icon(Icons.group_add)),
                  title: Text(
                    "New Group",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // subtitle: Text(
                  //   data[index]['lastMessage'].toString(),
                  //   style: const TextStyle(color: Colors.white70),
                  // ),
                ),
              ),
            ),

            Card(
              color: Colors.deepPurple[600],
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: CircleAvatar(child: Icon(Icons.smart_toy)),
                  title: Text(
                    "Chat with AI",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // subtitle: Text(
                  //   data[index]['lastMessage'].toString(),
                  //   style: const TextStyle(color: Colors.white70),
                  // ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Users on Chat app",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            Obx(
              ()=> ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: usersContactListController.usersList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){

                      // Get.toNamed("/ChatScreen", arguments: usersContactListController.usersList[index]);

                      Get.to(ChatScreen( selectedUsersData: usersContactListController.usersList[index],));

                    },
                    child: Card(
                      color: Colors.deepPurple[600],
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:  (usersContactListController.usersList[index].profileImage==null) ? AssetImage("assets/images/avatar-boy-2.jpg") : NetworkImage(usersContactListController.usersList[index].profileImage.toString()),
                        ),

                        title: Text(
                          usersContactListController.usersList[index].name.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: Text(
                          usersContactListController.usersList[index].email.toString(),
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
