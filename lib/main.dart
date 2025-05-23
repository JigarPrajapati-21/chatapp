/*

create a todo app using flutter , firebase firestore , firebase authentication , Getx state management

in this app user can login signup,

user can create section and add task section wise
ex. user create exercise section and user can add different task in exercise section
like task 1: running , task 2: meditation , task 3 : push ups , task 4 : pull ups  etc...
user create Study section and user can add different task in study section
like task 1: reading , task 2: home work , task 3 : project work etc...
user create spiritual section and user can add different task in spiritual section
like task 1: prayer , task 2: chanting etc...

user can create number of sections and add number of task section wise like above example


like this user can create multiple section and add multiple task in each section

user can set task for every day , or for specific day of week or for a specific dates of month,

user can see daily task and update task status where task is complete or not also user can add notes regarding task completion
also user can add how much time spent on task like 1 hour or 30 min or 17 min etc...

user can see daily , weekly , monthly , 6 monthly or yearly progress and generate report

also add a feature of home screen widget : in this features user can see daily progress and task on their home screen widget on mobile
also user can also add multiple custom home screen widget with some custom text and this text is inputted by user    also user can edit or delete this custom home screen widget

also add dark and light theme
make entire app responsive according to different mobile screen size

also make feature like is user can not update or submit daily progress by end of the day or before 10 pm then make app icon with RED color or angry type

also add notification feature

also make feature like user can see daily task of any day by selecting date or day

also user can see history of previous days task

also make feature like user complete their daily task then user can create daily streaks


make UI of the app is attractive and beautiful , professional
make UI 3D , and also add animations
use good color combination for professional look of UI

use graph, chart, pie chart etc...


also make user login persistence so that is user already logedin then no need to login again,
use email-password authentication for login signup
when user can signup get info like user name , email , password during signup when user signup successfully then create a collection to store user data like user name , email and other user profile details


use external fonts, icons to make ui professional

make welcome screens or no boarding screens or information screen so that user can get information for how to use this app

also make user profile section : in this section user can see their profile also user can add some info which is optional info not mandatory for user to input like weight, height,age , birth date




 */

import 'package:ChatConnect/pages/splash_screen/splash_screen.dart';
import 'package:ChatConnect/routes/page_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),//WelcomePage(),
    );
  }
}
