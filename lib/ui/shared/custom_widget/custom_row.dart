import 'package:e_commerc/ui/shared/colors.dart';
import 'package:e_commerc/ui/shared/shared_widgets/custom_text.dart';
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:flutter/material.dart';
class CustomRow extends StatelessWidget {
  final String name;
  final String text;
  const CustomRow({super.key, required this.name, required this.text});
  @override
  Widget build(BuildContext context) {
    return     Row(
                           children: [
                            CustomText(text: name,styleType: TextStyleType.FOCUSTEXT,
                            fontSize: screenWidth(26),fontWeight: FontWeight.bold,
                            ),
                                Spacer(),
                             Padding(
                               padding: EdgeInsetsDirectional.only(end: screenWidth(15)),
                               child: Text(text,
                               style: TextStyle(
                                fontWeight: FontWeight.bold
                               ),
                               ),
                             ),
                             Text('SP')
                                     ],
                                      );
  }
}