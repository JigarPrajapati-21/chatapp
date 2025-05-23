import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user_model.dart';

class AuthController extends GetxController {
  void signUp(context, String name, String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await createUsersCollection(name, email);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("user created")));

      Get.offAllNamed("/LoginScreen");


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("The password provided is too weak.")));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("The account already exists for that email.")));

      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Something went wrong")));

    }
  }

  Future<void> createUsersCollection(String name, String email) async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var newUser = UserModel(id: uid, name: name, email: email,onlineStatus: "Offline",);

    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set(newUser.toJson());
    } catch (e) {
      print("________________________________________________");
      print(e);
      print("++++++++++++++++++++++++++++++++++++");
    }
  }


  // void login(context,String email,String password)async{
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: email,
  //         password: password
  //     );
  //
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text("Login successful")));
  //
  //     Get.offAllNamed("/HomeScreen");
  //
  //
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //       ScaffoldMessenger.of(
  //         context,
  //       ).showSnackBar(SnackBar(content: Text("No user found for that email.")));
  //
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //       ScaffoldMessenger.of(
  //         context,
  //       ).showSnackBar(SnackBar(content: Text("Wrong password provided for that user.")));
  //
  //     }
  //   }
  // }

  void login(context, String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      await updateOnlineStatus("Online");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login successful")));

      Get.offAllNamed("/HomeScreen");

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No user found for that email.")));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Wrong password provided for that user.")));
      }
    }
  }




  // void logOut(context)async{
  //
  //   await FirebaseAuth.instance.signOut();
  //
  //   ScaffoldMessenger.of(
  //     context,
  //   ).showSnackBar(SnackBar(content: Text("Logout successful")));
  //
  //   Get.offAllNamed("/LoginScreen");
  //
  //
  //
  // }


  void logOut(context) async {
    await updateOnlineStatus("Offline");

    await FirebaseAuth.instance.signOut();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logout successful")));

    Get.offAllNamed("/LoginScreen");
  }




  Future<void> updateOnlineStatus(String status) async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        await FirebaseFirestore.instance.collection("users").doc(uid).update({
          'onlineStatus': status,
        });
      }
    } catch (e) {
      print("❌ Failed to update onlineStatus: $e");
    }
  }


}
