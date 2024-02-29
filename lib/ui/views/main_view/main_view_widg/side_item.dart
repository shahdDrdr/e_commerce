//import 'package:e_commerc/ui/shared/colors.dart';
import 'package:e_commerc/ui/shared/colors.dart';
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final bool? needClose;
  const SideItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.needClose = false});

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
       onTap: () {
          onTap();
          if (needClose!) Get.back();
        },
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: screenWidth(10)),
          child: Row(
            children: [
              Icon(
                icon,
                size: screenWidth(11),
                color: AppColors.grey,
              ),
              SizedBox(
                width: screenWidth(18)),
              Text(
                title,
                style: TextStyle(
                    fontSize: screenWidth(22),
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ));
  }
}
