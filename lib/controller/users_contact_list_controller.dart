import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';


class UsersContactListController extends GetxController {
  RxList<UserModel> usersList = <UserModel>[].obs;

  Future<void> getAllUsersContact() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('users').get();

      final users = snapshot.docs.map((doc) {
        final data = doc.data();
        return UserModel.fromJson(data);
      }).toList();

      usersList.value = users;

      print("✅ Users loaded: ${usersList.length}");
    } catch (e) {
      print("❌ Error fetching users: $e");
    }
  }
}
