import 'package:e_commerc/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  const CustomDivider({super.key, this.color=AppColors.grey});

  @override
  Widget build(BuildContext context) {
    return   Divider(
                      thickness: 2,
                      color: color,
                      height: 25,
                      
                    );
  }
}