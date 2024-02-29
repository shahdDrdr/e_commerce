
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:flutter/material.dart';
class CategoryWidget extends StatelessWidget {
  final String name;
  final Color color;
  const CategoryWidget({super.key, required this.name, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
                                              width: screenWidth(2),
                                              margin: EdgeInsetsDirectional.only(end: screenWidth(20)),  
                                              decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(color: const Color.fromARGB(255, 124, 124, 124)),
                                              color: color
                                              ),
                                              child: Center(child:
                                                Text(name,
                                              style:TextStyle(
                                              fontSize: screenWidth(20)
                                              ),
                                              )
                                              ),
                                               );
  }
}