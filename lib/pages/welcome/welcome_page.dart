// import 'package:chatapp/Congif/Strings.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:slide_to_act/slide_to_act.dart';
// import '../../Congif/images.dart';
// import 'package:get/get.dart';
//
// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 30),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     AssetsImage.appIconSvg,
//                     color: Theme.of(context).colorScheme.onBackground,
//                     height: 70,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Text(
//                 AppString.appName,
//                 style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//                   color: Theme.of(context).colorScheme.primary,
//                 ),
//               ),
//               SizedBox(height: 60),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//
//                 children: [
//                   SvgPicture.asset(AssetsImage.appIcon2Svg, width: 300),
//                 ],
//               ),
//               SizedBox(height: 100),
//               SlideAction(
//                 onSubmit: () {
//                   // Get.off(page)
//                 },
//                 innerColor: Theme.of(context).colorScheme.primary,
//                 outerColor: Theme.of(context).colorScheme.primaryContainer,
//                 text: "Slide to Chat",
//                 sliderRotate: false,
//                 // animationDuration: Duration(seconds: 1),
//                 sliderButtonIcon: Icon(Icons.ac_unit,color: Colors.white,),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:chatapp/Congif/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../../Congif/images.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
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
              mainAxisAlignment: MainAxisAlignment.center,
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

                /// Welcome Graphic
                Card(
                  elevation: 10,
                  shadowColor: theme.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      AssetsImage.appIcon2Svg,
                      width: 300,
                    ),
                  ),
                ),

                const SizedBox(height: 80),

                /// Slide to Chat Button
                SlideAction(
                  onSubmit: () {
                    // Get.off(page)
                    Get.offAllNamed("/LoginPage");
                  },
                  innerColor: theme.colorScheme.primary,
                  outerColor: theme.colorScheme.primaryContainer,
                  elevation: 12,
                  text: "Slide to Chat",
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w600,
                  ),
                  sliderRotate: false,
                  sliderButtonIcon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
