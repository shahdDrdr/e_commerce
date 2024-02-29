
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final String img;
  final bool isSelected;
  final Function onTap;
  const NavItem(
      {super.key,
      required this.isSelected,
      required this.onTap, required this.img});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          border: isSelected
              ? Border(
                left: BorderSide(color: Colors.orange,width: screenWidth(150)),
                right:  BorderSide(color: Colors.orange,width: screenWidth(150))
                  )
              : null,
        ),
        child:    Padding(
          padding: EdgeInsetsDirectional.only(start: screenWidth(50),end: screenWidth(50)),
          child: Image.asset('assets/images/pngs/drawable/$img.png',
          color: Color.fromARGB(255, 238, 237, 234),
          width: screenWidth(12),
          ),
        )
      ),
    );
  }
}
