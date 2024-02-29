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
                            Text(name,
                            style: TextStyle(
                            color: Color.fromRGBO(69, 95, 185, 1),
                           fontSize: screenWidth(26),fontWeight: FontWeight.bold
                                   ),
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