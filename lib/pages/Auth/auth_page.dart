import 'package:chatapp/pages/Auth/login_form.dart';
import 'package:chatapp/pages/Auth/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Congif/Strings.dart';
import '../../Congif/images.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {

    RxBool islogin =true.obs;


    var theme=Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primaryContainer.withOpacity(0.2),
                  theme.colorScheme.background,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
          
                    /// App Icon
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        AssetsImage.appIconSvg,
                        color: theme.colorScheme.primary,
                        height: 70,
                      ),
                    ),
          
                    const SizedBox(height: 20),
          
                    /// Welcome Text
                    Text(
                      'Welcome to',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onBackground.withOpacity(0.7),
                        fontSize: 20,
                        letterSpacing: 1.2,
                      ),
                    ),
          
                    const SizedBox(height: 6),
          
                    /// App Name
                    Text(
                      AppString.appName,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
          
                    const SizedBox(height: 40),
          
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: theme.colorScheme.primaryContainer
                        ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Obx(()=>Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      islogin.value=true;
                                    },
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width/2.5,
                                      child: Column(
                                        children: [
                                          Text("Login",
                                            style: islogin.value? theme.textTheme.bodyLarge:theme.textTheme.labelLarge,
                                          ),
                                          SizedBox(height: 5,),
                                          AnimatedContainer(duration: Duration(milliseconds: 200),
                                            width: islogin.value? 150:0,
                                            height: 3  ,
                                            decoration: BoxDecoration(
                                                color: theme.colorScheme.primary,
                                                borderRadius: BorderRadius.circular(100)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
          
                                  InkWell(
                                    onTap: (){
                                      islogin.value=false;
                                    },
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width/2.5,
                                      child: Column(
                                        children: [
                                          Text("Signup",
                                            style: islogin.value?theme.textTheme.labelLarge: theme.textTheme.bodyLarge,),
                                          SizedBox(height: 5,),
                                          AnimatedContainer(duration: Duration(milliseconds: 200),
                                            width: islogin.value? 0:150,
                                            height: 3  ,
                                            decoration: BoxDecoration(
                                                color: theme.colorScheme.primary,
                                                borderRadius: BorderRadius.circular(100)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
          
          
                                ],
                              ),),
                              SizedBox(height: 20,),
                              Obx(()=> islogin.value? LoginForm():SignupForm(),),
                            ],
                          ))
                        ],
                      ),
                    ),
          
          
          
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      
    );
  }
}
