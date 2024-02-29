
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:e_commerc/ui/views/main_view/main_view_widg/nav_item.dart';
import 'package:flutter/material.dart';

enum BottomNavigationEnum {
  HOME,
  PRODUCT,
  CART,
  // NOTIFICATIONS,
  // FAVORITE,
  // SETTINGS,
}

class CustomBottmNavigation extends StatefulWidget {
  final BottomNavigationEnum selectedView;
  final Function(BottomNavigationEnum, int) onTap;
  const CustomBottmNavigation(
      {super.key, required this.selectedView, required this.onTap});

  @override
  State<CustomBottmNavigation> createState() => _CustomBottmNavigationState();
}

class _CustomBottmNavigationState extends State<CustomBottmNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenWidth(7),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 41, 116, 151),
          Color.fromARGB(255, 95, 178, 216),
          Color.fromARGB(255, 181, 222, 241),
        ]
        
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      
       
        color: Colors.white,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavItem(
              onTap: () {
                widget.onTap(BottomNavigationEnum.HOME, 0);
              },
              img: 'category',
              isSelected: widget.selectedView == BottomNavigationEnum.HOME),
          NavItem(
            onTap: () {
              widget.onTap(BottomNavigationEnum.PRODUCT, 1);
            },
           img:'product' ,
            isSelected: widget.selectedView == BottomNavigationEnum.PRODUCT,
          ),
            NavItem(
            onTap: () {
              widget.onTap(BottomNavigationEnum.CART, 2);
            },
           img:'cart' ,
            isSelected: widget.selectedView == BottomNavigationEnum.CART,
          ),
          
        ],
      ),
    );
  }
}
