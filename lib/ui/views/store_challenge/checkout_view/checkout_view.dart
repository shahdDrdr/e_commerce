import 'package:e_commerc/ui/shared/colors.dart';
import 'package:e_commerc/ui/shared/custom_widget/custom_divider.dart';
import 'package:e_commerc/ui/shared/custom_widget/custom_row.dart';
import 'package:e_commerc/ui/shared/utils.dart';

import 'package:e_commerc/ui/views/store_challenge/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: screenWidth(20),end: screenWidth(20),top: screenWidth(7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your order placed successfully',
            style: TextStyle(
              fontSize: screenWidth(18),
              fontWeight: FontWeight.bold,
            ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: screenWidth(3),bottom: screenWidth(25)),
              child: CustomRow(name: 'Order NO:', text: '#123910'),
            ),
            CustomRow(name: 'Items Count:', text:'${cart.cartCount.value}'),
            CustomDivider(color: AppColors.blue,),
             CustomRow(name: 'Sub Total', text: '${cart.subTotal.value}'),
                                  CustomDivider(),
                                   CustomRow(name: 'Tax:', text: '${cart.taxAmount.value}'),
                                   CustomDivider(),
                                    CustomRow(name: 'Delivery Fees:', text: '${cart.deliveryFees.value}'),
                                     CustomDivider(),
                                      CustomRow(name: 'Total:', text: '${cart.total.value}'),
                                        CustomDivider(color: AppColors.blue,),
                                             
                                               InkWell(
                                                onTap: (){
                                                  Get.off(()=>MainView());
                                                },
                                                 child: Center(
                                                   child: Container(
                                                   width: screenWidth(1.5),
                                                   height: screenWidth(10),
                                                   margin: EdgeInsetsDirectional.only(top: screenWidth(3.8)),
                                                   padding: EdgeInsetsDirectional.only(start: screenWidth(8),top: screenWidth(68)),
                                                    decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.circular(25),
                                                      color: Color.fromRGBO(69, 95, 185, 1),
                                                                                  ),
                                                     child: Text('Continue Shopping',
                                                        style: TextStyle(
                                                         color: Colors.white,
                                                          fontSize:screenWidth(22) 
                                                        ),
                                                        ),
                                                    ),
                                                 ),
                                               ),
                                                                           
                                             
                                        
        
           
          ],
        ),
      ),
    ),
    );
  }
}