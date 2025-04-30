import 'package:chatapp/Congif/page_routes.dart';
import 'package:chatapp/Congif/themes.dart';
import 'package:chatapp/pages/splashPage/splash_page.dart';
import 'package:chatapp/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}
//C:\Users\DC\Downloads\flutter_windows_3.24.5-stable\flutter\bin\cache\dart-sdk
//C:\Users\DC\Downloads\flutter_windows_3.24.5-stable\flutter\bin\cache\dart-sdk
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat App',
      getPages: pageRoutes,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      home: WelcomePage(),
    );
  }
}
