import 'package:chatapp/chatPage/chat_page.dart';
import 'package:chatapp/pages/home_page/home_page.dart';
import 'package:get/get.dart';

import '../pages/Auth/auth_page.dart';

var pageRoutes=[
  GetPage(
      name: "/LoginPage",
      page: ()=> AuthPage(),
    transition: Transition.rightToLeft,
    // transitionDuration: Duration(seconds: 3),
  ),
  GetPage(
    name: "/HomePage",
    page: ()=> HomePage(),
    transition: Transition.rightToLeft,
    // transitionDuration: Duration(seconds: 3),
  ),
  GetPage(
    name: "/ChatPage",
    page: ()=> ChatPage(),
    transition: Transition.rightToLeft,
    // transitionDuration: Duration(seconds: 3),
  ),
];