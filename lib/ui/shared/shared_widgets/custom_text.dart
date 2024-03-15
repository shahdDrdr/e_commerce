
import 'package:e_commerc/ui/shared/colors.dart';
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:flutter/material.dart';

enum TextStyleType {
  TITLE,
  FOCUSTEXT,
  BODY,
  BUTTON,
}
class CustomText extends StatelessWidget {
  final String text;
  final TextStyleType? styleType;
  final Color? mColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
  const CustomText({
    super.key,
    required this.text,
    this.styleType = TextStyleType.BODY,
    this.fontWeight=FontWeight.w400,
    this.fontSize,
    this.mColor, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getStyle(),
    );
  }
  TextStyle getStyle() {
    TextStyle result = TextStyle();
    switch (styleType) {
      case TextStyleType.TITLE:
        result = TextStyle(
            fontSize: screenWidth(15),
            fontWeight:FontWeight.bold,
            );
        break;
      case TextStyleType.FOCUSTEXT:
        result = TextStyle(
            fontSize: fontSize ?? null, color: AppColors.purple,fontWeight: fontWeight);
        break;
      case TextStyleType.BODY:
        result = TextStyle(
            fontSize: fontSize ?? null, fontWeight: fontWeight, color: mColor,height: height??null);
        break;
      case TextStyleType.BUTTON:
        result = TextStyle(
            fontSize:fontSize??null, fontWeight: fontWeight, color: AppColors.white,);
        break;
      default:
        result = TextStyle(
            fontSize: screenWidth(25),
            fontWeight: FontWeight.w400,
            color: mColor);
        break;
    }

    return result;
  }
}