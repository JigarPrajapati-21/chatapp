import 'package:flutter/material.dart';
import '../home_chat/chatroom_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    ChatroomListScreen(),
    Center(child: Text("Group Screen", style: TextStyle(color: Colors.white, fontSize: 18))),
    Center(child: Text("Call Screen", style: TextStyle(color: Colors.white, fontSize: 18))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[700],
      body: SafeArea(
        child: screens[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: Colors.deepPurple[800],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Group"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// import '../Chat/chatroom_list_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   var selectedIndex=0;
//
//   var screens=[
//     ChatroomListScreen(),
//     // Center(child: Text("1"),),
//     Center(child: Text("2"),),
//     Center(child: Text("3"),),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens[selectedIndex],
//
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
//           BottomNavigationBarItem(icon: Icon(Icons.group), label: "Group"),
//           BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
//         ],currentIndex: selectedIndex,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white70,
//         onTap: (value) {
//           setState(() {
//             selectedIndex=value;
//             // print(selectedIndex);
//           });
//         },
//
//         backgroundColor: Colors.blue,
//       ),
//     );
//   }
// }
