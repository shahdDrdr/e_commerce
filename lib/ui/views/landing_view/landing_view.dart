import 'package:e_commerc/core/translation/app_translation.dart';
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:e_commerc/ui/views/landing_view/landing_controller.dart';
import 'package:e_commerc/ui/views/main_view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  LandingContrller controller=Get.put(LandingContrller());
  //!change

  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/pngs/drawable/main_background.png',
            width: screenWidth(1),
            fit: BoxFit.fitWidth,
          ),
          //!change

            Container(
             margin: EdgeInsetsDirectional.only(start: screenWidth(23)),
          width: screenWidth(2),
              child: DropdownButton<String>(
                 onChanged: (value) {
              setState(() {
                  if(value=='English'){
                controller.changeLanguage('en');
              }
              else{
                controller.changeLanguage('ar');
              }
              });
            },
              hint: const Center(
                child: Text(
              'Select language',
              style: TextStyle(
                color: Colors.white
              ),
            )),
             underline: Container(),
               dropdownColor: Color.fromARGB(255, 224, 216, 208),
           // isExpanded: true,
              items: controller.lang
                .map((e) => DropdownMenuItem(
                      value: e,
                   
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          e,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    )).toList(),
                 
              ),
   ),
          Positioned(
            top: screenWidth(0.69),
            left: screenWidth(12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(0, 173, 239, 1),
                  Color.fromRGBO(0, 173, 239, 1),
                  Color.fromRGBO(46, 49, 146, 1),
                ]),
              ),
              child: ElevatedButton(
                onPressed: () =>
                  Get.off(MainView()),
                child: Text(
                  tr('key_login'),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(screenWidth(1.3), 50),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenWidth(0.61),
            left: screenWidth(12),
            child: ElevatedButton(
                onPressed: () => Get.off(MainView()),
                child: Text(
                  tr('key_signup'),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(screenWidth(1.3), 50),
                )),
          ),
        ],
      ),
    ));
  }
}
