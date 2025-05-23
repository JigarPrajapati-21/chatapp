import 'package:ChatConnect/controller/image_picker_controller.dart';
import 'package:ChatConnect/controller/login_user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginUsersProfileScreen extends StatelessWidget {
  const LoginUsersProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginUserProfileController loginUserProfileController = Get.put(
      LoginUserProfileController(),
    );

    ImagePickerController imagePickerController = Get.put(
      ImagePickerController(),
    );

    RxBool isEditable = false.obs;

    // TextEditingController nameController=TextEditingController();
    // TextEditingController emailController=TextEditingController();
    // TextEditingController phoneNumberController=TextEditingController();
    // TextEditingController aboutController=TextEditingController();

    return Scaffold(
      backgroundColor: Colors.deepPurple[700],
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.deepPurple[800],
        foregroundColor: Colors.white,
        elevation: 0,
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          final TextEditingController nameController = TextEditingController(
            text: loginUserProfileController.loginUsersDetails.value.name,
          );
          final TextEditingController emailController = TextEditingController(
            text: loginUserProfileController.loginUsersDetails.value.email,
          );
          final TextEditingController phoneNumberController =
              TextEditingController(
                text:
                    loginUserProfileController
                        .loginUsersDetails
                        .value
                        .phoneNumber ?? "1212121212",
              );
          final TextEditingController aboutController = TextEditingController(
            text: loginUserProfileController.loginUsersDetails.value.about ??".......",
          );

          return Container(
            // height: 500,
            width: double.infinity,
            padding: EdgeInsets.only(top:  50,left: 10,right: 10,bottom: 50),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.deepPurple[500],
            borderRadius: BorderRadius.circular(10),boxShadow: [
             BoxShadow(color: Colors.deepPurple.shade900,blurRadius: 5,blurStyle: BlurStyle.outer),
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  final imageUrl = imagePickerController.imageUrl.value;
                  final profileImage =
                      loginUserProfileController
                          .loginUsersDetails
                          .value
                          .profileImage;

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          imageUrl != null && imageUrl.isNotEmpty
                              ? NetworkImage(imageUrl)
                              : (profileImage != null && profileImage.isNotEmpty
                                  ? NetworkImage(profileImage)
                                  : AssetImage("assets/images/avatar-boy-2.jpg")
                                      as ImageProvider),
                    ),
                  );
                }),

                // (loginUserProfileController
                //                 .loginUsersDetails
                //                 .value
                //                 .profileImage ==
                //             null ||
                //         loginUserProfileController
                //             .loginUsersDetails
                //             .value
                //             .profileImage!
                //             .isEmpty)
                //     ? Padding(
                //       padding: EdgeInsets.symmetric(vertical: 30),
                //       child: CircleAvatar(
                //         radius: 50,
                //         backgroundImage: (AssetImage(
                //           "assets/images/avatar-boy-2.jpg",
                //         )),
                //
                //         // backgroundImage:  (usersContactListController.usersList[index].profileImage==null) ? AssetImage("assets/images/avatar-boy-2.jpg") : NetworkImage(usersContactListController.usersList[index].profileImage.toString()),
                //       ),
                //     )
                //     : Padding(
                //       padding: EdgeInsets.symmetric(vertical: 30),
                //       child: CircleAvatar(
                //         radius: 50,
                //         backgroundImage: (NetworkImage(
                //           imagePickerController.imageUrl.value.toString() ??
                //               loginUserProfileController
                //                   .loginUsersDetails
                //                   .value
                //                   .profileImage
                //                   .toString(),
                //         )),
                //
                //         // backgroundImage:  (usersContactListController.usersList[index].profileImage==null) ? AssetImage("assets/images/avatar-boy-2.jpg") : NetworkImage(usersContactListController.usersList[index].profileImage.toString()),
                //       ),
                //     ),
                isEditable.value
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            imagePickerController.pickImage();
                            print("__________________");
                            print(
                              imagePickerController.imageUrl.value.toString(),
                            );
                          },
                          icon: Icon(Icons.image),
                          label: Text("Pick image"),
                        ),

                        // ElevatedButton.icon(
                        //   onPressed: () {
                        //     loginUserProfileController
                        //         .deleteLoginUsersProfileImage(
                        //           context,
                        //           "profileImage",
                        //         );
                        //
                        //     isEditable.value = false;
                        //   },
                        //   icon: Icon(Icons.remove_circle_outlined),
                        //   label: Text("Remove Profile Image"),
                        // ),
                      ],
                    )
                    : Container(),

                Column(
                  spacing: 10,
                  children: [
                    TextField(
                      controller: nameController,

                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        // hintText: "jigar",
                        labelText: "name",
                        enabled: false,
                        prefixIconColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.white),

                        border: InputBorder.none,
                      ),
                    ),

                    TextField(
                      controller: emailController,

                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        // hintText: "jigar",
                        labelText: "email",
                        enabled: false,
                        prefixIconColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.white),

                        border: InputBorder.none,
                      ),
                    ),

                    TextField(
                      controller: phoneNumberController,

                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call),
                        // hintText: "jigar",
                        labelText: "phone number",
                        enabled: false,
                        prefixIconColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.white),

                        border: InputBorder.none,
                      ),
                    ),

                    TextField(
                      controller: aboutController,
                      // maxLines: 5,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.info),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Write about here...",
                        labelText: "about",
                        fillColor: Colors.deepPurple,
                        filled: isEditable.value,
                        enabled: isEditable.value,
                        prefixIconColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.white),

                        border: InputBorder.none,
                      ),
                    ),

                    SizedBox(height: 30),

                    !isEditable.value
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                isEditable.value = true;
                              },
                              icon: Icon(Icons.edit),
                              label: Text("Edit"),
                            ),
                          ],
                        )
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                loginUserProfileController
                                    .updateLoginUserDetails(
                                      context,
                                      aboutController.text.trim(),
                                      imagePickerController.imageUrl.value
                                          .toString() ?? loginUserProfileController.loginUsersDetails.value.profileImage.toString(),
                                    );
                                isEditable.value = false;
                              },
                              icon: Icon(Icons.save),
                              label: Text("Save"),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                isEditable.value = false;
                                imagePickerController.imageUrl.value = "";
                              },
                              icon: Icon(Icons.edit),
                              label: Text("Cancel"),
                            ),
                          ],
                        ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// import 'package:chatapp/controller/login_user_profile_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class LoginUsersProfileScreen extends StatelessWidget {
//   const LoginUsersProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     LoginUserProfileController loginUserProfileController = Get.put(
//       LoginUserProfileController(),
//     );
//
//     final TextEditingController nameController = TextEditingController(
//       text: loginUserProfileController.loginUsersDetails.value.name,
//     );
//     final TextEditingController emailController = TextEditingController(
//       text: loginUserProfileController.loginUsersDetails.value.email,
//     );
//     final TextEditingController phoneNumberController = TextEditingController(
//       text: loginUserProfileController.loginUsersDetails.value.phoneNumber,
//     );
//     final TextEditingController aboutController = TextEditingController(
//       text: loginUserProfileController.loginUsersDetails.value.about,
//     );
//
//     // TextEditingController nameController=TextEditingController();
//     // TextEditingController emailController=TextEditingController();
//     // TextEditingController phoneNumberController=TextEditingController();
//     // TextEditingController aboutController=TextEditingController();
//
//     return Scaffold(
//       backgroundColor: Colors.deepPurple[700],
//       appBar: AppBar(
//         title: Text("Profile", style: TextStyle(fontSize: 18)),
//         backgroundColor: Colors.deepPurple[800],
//         foregroundColor: Colors.white,
//         elevation: 0,
//         // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
//       ),
//       body: Container(
//         // height: 500,
//         width: double.infinity,
//         padding: EdgeInsets.all(10),
//         margin: EdgeInsets.all(10),
//         decoration: BoxDecoration(color: Colors.deepPurple[500]),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 30),
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: (AssetImage("assets/images/avatar-boy-2.jpg")),
//                 // backgroundImage:  (usersContactListController.usersList[index].profileImage==null) ? AssetImage("assets/images/avatar-boy-2.jpg") : NetworkImage(usersContactListController.usersList[index].profileImage.toString()),
//               ),
//             ),
//
//             Column(
//               spacing: 10,
//               children: [
//
//                 TextField(
//                   controller: nameController,
//
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.person),
//                     // hintText: "jigar",
//                     labelText: "name",
//                     enabled: false,
//                     prefixIconColor: Colors.white,
//                     labelStyle: TextStyle(color: Colors.white),
//
//                     border: InputBorder.none,
//                   ),
//                 ),
//
//
//                 TextField(
//                   controller: emailController,
//
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.mail),
//                     // hintText: "jigar",
//                     labelText: "email",
//                     enabled: false,
//                     prefixIconColor: Colors.white,
//                     labelStyle: TextStyle(color: Colors.white),
//
//                     border: InputBorder.none,
//                   ),
//                 ),
//
//                 TextField(
//                   controller: phoneNumberController,
//
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.call),
//                     // hintText: "jigar",
//                     labelText: "phone number",
//                     enabled: false,
//                     prefixIconColor: Colors.white,
//                     labelStyle: TextStyle(color: Colors.white),
//
//                     border: InputBorder.none,
//                   ),
//                 ),
//
//                 TextField(
//                   controller: aboutController,
//
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.info),
//                     // hintText: "jigar",
//                     labelText: "about",
//                     enabled: false,
//                     prefixIconColor: Colors.white,
//                     labelStyle: TextStyle(color: Colors.white),
//
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
