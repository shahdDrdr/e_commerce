
import 'dart:io';
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:e_commerc/ui/views/main_view/main_view_widg/side_item/image_picker_controller.dart';
import 'package:e_commerc/ui/views/landing_view/landing_view.dart';
import 'package:e_commerc/ui/views/main_view/main_view_widg/side_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerc/ui/views/main_view/main_view_widg/side_item/image_picker_controller.dart';
class SideMenu extends StatefulWidget {

  const SideMenu({super.key,});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
    ImageController controller=Get.put(ImageController());
  @override
  Widget build(BuildContext context) {
    //SideMenuController controller=Get.put(SideMenuController());
    return Container(
      color: const Color.fromARGB(255, 243, 243, 243),
      width: screenWidth(1.4),
      padding:
          EdgeInsetsDirectional.only(start: screenWidth(15), end:screenWidth(19), top:screenWidth(22)),
      child: ListView(
        children: [
          SizedBox(
            width: screenWidth(2),
            height: screenWidth(3),
            child: 
            Obx(() {
              return Stack(children: [
    Container(
           width: screenWidth(4),
                      height: screenWidth(4),
                      margin: EdgeInsetsDirectional.only(start: screenWidth(5.5)),
                      decoration: BoxDecoration(
                       // borderRadius: BorderRadius.all(Radius.circular(45)),
                        color: Color.fromRGBO(228, 213, 213, 1),
                      //  border:Border.all(color: Colors.black),
                        ),
                        child:
            controller.imagePath.value.isNotEmpty?
        Image.file(File(controller.imagePath.value),fit: BoxFit.cover,
                    ):
      Icon(Icons.photo_size_select_actual_rounded)
        ),
      controller.imagePath.value.isNotEmpty?
       Container(
        margin: EdgeInsetsDirectional.only(top: screenWidth(5.3),start: screenWidth(2.7)),
        width: screenWidth(13),
        height: screenWidth(13),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color.fromARGB(255, 179, 152, 152)),
        child: Icon(Icons.edit,size: screenWidth(20),),
       ):  Positioned(
        top: screenWidth(3.7),
        left: screenWidth(5.5),
         child: InkWell(
          onTap: (){
            controller.pickImage();        },
          child: Text('select image',
          style: TextStyle(fontSize: screenWidth(22)),
          
          ),
          ),
       )
              ],);
            }),),
          SideItem(
              icon: Icons.local_print_shop, title: 'My orders', onTap: () {}),
          SideItem(
              icon: Icons.favorite_outline, title: 'Wish list', onTap: () {}),
          SideItem(icon: Icons.tune_outlined, title: 'Settings', onTap: () {}),
          SideItem(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              onTap: () {}),
          SideItem(icon: Icons.help_outline, title: 'Help & FAQ', onTap: () {}),
          // SideItem(
          //     icon: Icons.person,
          //     title: 'Logout',
          //     onTap: () {
          //       storage.setLoggedIn(false);
          //     Get.off(LandingView());
          //     }),
        ],
      ),
    );
  }
}
