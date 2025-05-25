import 'package:ChatConnect/controller/chat_screen_controller.dart';
import 'package:ChatConnect/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  final UserModel selectedUsersData;
   ChatScreen({super.key, required this.selectedUsersData});

  final ScrollController _scrollController = ScrollController();


  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    ChatScreenController chatScreenController = Get.put(ChatScreenController());

    TextEditingController chatMessageController = TextEditingController();




    return Scaffold(
      backgroundColor: Colors.deepPurple[700],
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 18,
                // backgroundImage: selectedUsersData.profileImage!.isNotEmpty && selectedUsersData.profileImage.toString()!="" ? NetworkImage(selectedUsersData.profileImage.toString()) : AssetImage("assets/images/avatar-boy-2.jpg"),

                backgroundImage: (selectedUsersData.profileImage != null && selectedUsersData.profileImage!.isNotEmpty)
                    ? NetworkImage(selectedUsersData.profileImage!)
                    : AssetImage("assets/images/avatar-boy-2.jpg") as ImageProvider,


              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedUsersData.name.toString(), //"user name",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  selectedUsersData.onlineStatus.toString(), //"online",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ],
        ),

        backgroundColor: Colors.deepPurple[800],
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 100),

        child: StreamBuilder(
          stream: chatScreenController.receiveMessages(
            selectedUsersData.id.toString(),
          ),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No users found');
            }

            final msgList = snapshot.data!;
            WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
            return ListView.builder(
              controller: _scrollController,
              itemCount: msgList.length,
              itemBuilder: (context, index) {
                final msg = msgList[index];

                String original = msg.timestamp.toString();

                // Parse the original string to DateTime
                DateTime dateTime = DateTime.parse(original);

                // Format it to 12-hour format with AM/PM
                String formattedTime = DateFormat('hh:mm a').format(dateTime);

                return Row(
                  mainAxisAlignment: selectedUsersData.id==msg.receiverId? MainAxisAlignment.end:MainAxisAlignment.start,



                  children: [
                    Column(
                      crossAxisAlignment: selectedUsersData.id==msg.receiverId ? CrossAxisAlignment.end:CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minWidth: 0,
                            maxWidth: MediaQuery.sizeOf(context).width / 1.5,
                          ),
                          // width: MediaQuery.sizeOf(context).width / 1.5,
                          padding: EdgeInsets.all(10),
                          // margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade400,
                            borderRadius: selectedUsersData.id==msg.receiverId? BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(0),
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ) : BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(0),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            msg.message.toString()??"aaaa",
                            style: TextStyle(color: Colors.white,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: selectedUsersData.id==msg.receiverId? MainAxisAlignment.end:MainAxisAlignment.start,
                            children: [

                              Text(formattedTime,style: TextStyle(
                                color: Colors.white,
                                fontSize: 10
                              ),),
                            ],
                          ),
                        ),

                        (msg.imageUrl!=null && msg.imageUrl!="") ? Container(
                          width: MediaQuery.sizeOf(context).width / 1.5,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade400,

                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Image.network(msg.imageUrl.toString()),
                        ) : Container(),
                      ],
                    ),
                  ],
                );
              },
            );



          },
        ),

        // child: ListView(
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         Column(
        //           children: [
        //             Container(
        //               width: MediaQuery.sizeOf(context).width / 1.5,
        //               padding: EdgeInsets.all(10),
        //               decoration: BoxDecoration(
        //                 color: Colors.deepPurple.shade400,
        //                 borderRadius: BorderRadius.only(
        //                   topLeft: Radius.circular(20),
        //                   bottomRight: Radius.circular(20),
        //                   topRight: Radius.circular(20),
        //                 ),
        //               ),
        //               child: Text(
        //                 "AAaaaaaaaa ssssss sdflnFNOWNF QWKDJ DJNK KDlnFNOWNF QWKDJ DJNK KDlnFNOWNF QWKDJ DJNK KDJF ",
        //                 style: TextStyle(color: Colors.white),
        //               ),
        //             ),
        //
        //             Container(
        //               width: MediaQuery.sizeOf(context).width / 1.5,
        //               padding: EdgeInsets.all(10),
        //               decoration: BoxDecoration(
        //                 color: Colors.deepPurple.shade400,
        //
        //                 borderRadius: BorderRadius.only(
        //                   topLeft: Radius.circular(20),
        //                   bottomRight: Radius.circular(20),
        //                   topRight: Radius.circular(20),
        //                 ),
        //               ),
        //               child: Image.asset("assets/images/avatar-boy-2.jpg"),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: chatMessageController,
                      decoration: InputDecoration(
                        isDense: true, // reduces internal height
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        fillColor: Colors.deepPurple.shade100,
                        filled: true,
                        hintText: "Message...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt_outlined),
                  ),
                ],
              ),
            ),
          ),

          IconButton(
            onPressed: () {
              chatScreenController.sendMessage(
                chatMessageController.text.trim().toString(),
                selectedUsersData.id.toString(),
              );

              chatMessageController.clear();
            },
            padding: EdgeInsets.only(right: 10),

            icon: Icon(Icons.send, color: Colors.deepPurple.shade100, size: 30),
          ),
        ],
      ),
    );
  }
}
