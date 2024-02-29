
import 'package:e_commerc/ui/shared/colors.dart';
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:e_commerc/ui/views/splash_view/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashView> {
    //!   Navigator.push => Get.to(LandingView());
  //?    Navigator.pushReplacement  => Get.off(LandingView());
  //*     Navigator.pushAndRemoveUntil  => Get.offAll(LandingView());
  //todo    Navigator.pop  => Get.back();
 
  @override
  Widget build(BuildContext context) {
 SplashController controller=Get.put(SplashController());
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.only(top: screenWidth(1.5)),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          Color.fromARGB(255, 42, 104, 155),
          Color.fromARGB(255, 74, 160, 230),
          const Color.fromARGB(255, 162, 206, 241)

        ])),
        width: screenWidth(1),
        child: Column(children: [
          Icon(Icons.local_mall_rounded,size: screenWidth(5),color: AppColors.white,),
          Text('e_Commerce',
          style: TextStyle(
            fontSize: screenWidth(18),
            fontWeight: FontWeight.bold,
            color: AppColors.white

          ),
          )
        ],),
      ),
    ));
  }
}
