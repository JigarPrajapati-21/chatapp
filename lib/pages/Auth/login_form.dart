import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(height: 20,),

        TextField(
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.email),
            // border: InputBorder.none
          ),
        ),

        SizedBox(height: 20,),

        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.password),
            // border: InputBorder.none
          ),
        ),

        SizedBox(height: 50,),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: (){
            Get.offAllNamed("/HomePage");
          },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary
              ),
              child: Text("Login")),
        ),



      ],
    );
  }
}
