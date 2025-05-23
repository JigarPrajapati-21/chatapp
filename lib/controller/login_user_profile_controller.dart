import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

class LoginUserProfileController extends GetxController {

  Rx<UserModel> loginUsersDetails = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    getLoginUsersDetails();
  }


  Future<void> getLoginUsersDetails() async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .get();

      if (docSnapshot.exists) {
        loginUsersDetails.value = UserModel.fromJson(docSnapshot.data()!); // Replace entire list with the one user
        print("✅ User loaded");
      } else {
        print("❌ No user found ");
      }
    } catch (e) {
      print("❌ Error fetching user: $e");
    }
  }

  Future<void> updateLoginUserDetails(context,String about,String imageUrl) async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'name': loginUsersDetails.value.name,
        'email': loginUsersDetails.value.email,
        'phoneNumber': loginUsersDetails.value.phoneNumber,
        'about': about,
        'profileImage':imageUrl.toString(),
        // Add other fields if needed
      });

      getLoginUsersDetails();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User details updated successfully")));

      print("✅ User details updated successfully");
    } catch (e) {
      print("❌ Error updating user: $e");
    }
  }

  Future<void> deleteLoginUsersProfileImage(context,String fieldName) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        fieldName: FieldValue.delete(),
      });


      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("profile image deleted successfully.")));

      print("🗑️ '$fieldName' field deleted successfully.");

      getLoginUsersDetails();

      // Reload updated user details
      await getLoginUsersDetails();
    } catch (e) {
      print("❌ Error deleting field '$fieldName': $e");
    }
  }



}