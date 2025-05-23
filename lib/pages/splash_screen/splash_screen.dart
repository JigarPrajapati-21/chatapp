import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override


  void initState() {
    super.initState();
    // Delay for 3 seconds then navigate
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null && user.uid.isNotEmpty) {
        Get.offAllNamed("/HomeScreen");
      } else {
        Get.offAllNamed("/LoginScreen");
      }
    });


    // Timer(Duration(seconds: 3), () {
    //
    //   if(FirebaseAuth.instance.currentUser!.uid.isNotEmpty){
    //     Get.offAllNamed("/HomeScreen");
    //   }else{
    //     Get.offAllNamed("/LoginScreen");
    //   }
    //
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              'ChatConnect',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Let\'s chat together',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
