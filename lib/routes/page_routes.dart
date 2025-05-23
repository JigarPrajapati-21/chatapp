import 'package:ChatConnect/pages/Auth/login_screen.dart';
import 'package:ChatConnect/pages/Auth/signup_screen.dart';
import 'package:ChatConnect/pages/profile/login_users_profile_screen.dart';
import 'package:get/get.dart';
import 'package:ChatConnect/pages/Home/home_screen.dart';

import '../pages/chat/chat_screen.dart';
import '../pages/home_chat/users_contect_list/users_contect_list_screen.dart';


 List<GetPage<dynamic>>? pageRoutes=[
  GetPage(
    name: "/HomeScreen",
    page: ()=> HomeScreen(),
    transition: Transition.rightToLeft,
  ),
   GetPage(
     name: "/LoginScreen",
     page: ()=> LoginScreen(),
     transition: Transition.rightToLeft,
   ),
   GetPage(
     name: "/SignupScreen",
     page: ()=> SignupScreen(),
     transition: Transition.rightToLeft,
   ),
   GetPage(
     name: "/UsersListScreen",
     page: ()=> UsersContactListScreen(),
     transition: Transition.rightToLeft,
   ),
   GetPage(
     name: "/ChatScreen",
     page: () => ChatScreen(selectedUsersData: Get.arguments),
     transition: Transition.rightToLeft,
   ),

   GetPage(
     name: "/LoginUsersProfileScreen",
     page: () => LoginUsersProfileScreen(),
     transition: Transition.rightToLeft,
   ),

 ];