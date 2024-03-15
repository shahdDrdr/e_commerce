



import 'package:e_commerc/ui/shared/colors.dart';
import 'package:e_commerc/ui/shared/custom_widget/custom_divider.dart';
import 'package:e_commerc/ui/shared/custom_widget/custom_row.dart';
import 'package:e_commerc/ui/shared/shared_widgets/custom_text.dart';
import 'package:e_commerc/ui/shared/utils.dart';

import 'package:e_commerc/ui/views/store_challenge/checkout_view/checkout_view.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class CartsView extends StatefulWidget {
  const CartsView({super.key});

  @override
  State<CartsView> createState() => _CartsViewState();
}
class _CartsViewState extends State<CartsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: screenWidth(20),end: screenWidth(20),top: screenWidth(20)),
        child: ListView(
          children: [
          Row(
            children: [
              Padding(
                padding:  EdgeInsetsDirectional.only(start:screenWidth(25),end: screenWidth(1.6) ),
                child: CustomText(text: 'Carts',
                styleType: TextStyleType.TITLE,
                )
              ),
              InkWell(
                onTap: (){
                  cart.clearCart();

                },
                child: Icon(Icons.delete_outlined,color: Colors.red,
                size: screenWidth(15),
                ),
              )
            ],
          ),
          Obx((){
           return ListView.builder(
             physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
               
                              itemCount: cart.cartList.length,
                              itemBuilder: (BuildContext context, int index){
                                return Container(
                                  margin: EdgeInsetsDirectional.only(top: screenWidth(20)),
                                  width: screenWidth(1),
                                 height:screenWidth(2.5) ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: const Color.fromARGB(255, 88, 88, 88)),
                  //color: Colors.black
                ),
                child: Row(
                  children: [
                    Image.network(cart.cartList[index].productModel?.image??'',
                width: screenWidth(4.5),  
                height: screenWidth(5),
                  ),
                    Container(
                      width: screenWidth(1.7),
                       //color: Colors.amber,
                       margin: EdgeInsetsDirectional.only(top: screenWidth(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                                       Text(cart.cartList[index].productModel?.title??"",
                                       overflow: TextOverflow.ellipsis,
                                       style: TextStyle(
                                         fontSize: screenWidth(30),
                                         fontWeight: FontWeight.bold
                                       ),
                                       ),
                                       Padding(
                                         padding: EdgeInsetsDirectional.only(top: screenWidth(40),bottom: screenWidth(40)),
                                         child: Row(
                                           children: [
                                            CustomText(text: 'Price:',
                                            styleType: TextStyleType.FOCUSTEXT,
                                            fontSize: screenWidth(28),
                                            ),
                                             Text('${cart.cartList[index].productModel?.price}'),
                                           ],
                                         ),
                                       ),
                                         Row(
                                         children: [
                                            CustomText(text: 'Total:',
                                            styleType: TextStyleType.FOCUSTEXT,
                                            fontSize: screenWidth(28),
                                            ),
                                           Text('${cart.cartList[index].totals}'),
                                         ],
                                       ),
                        Padding(
                          padding:EdgeInsetsDirectional.only(start: screenWidth(2.5),),
                          child: Row(
                                      children: [
                                      InkWell(
                                        onTap: (){
                                          cart.changeQty(model: cart.cartList[index], incress: true);
                                        },
                                        child: Icon(Icons.add_circle,
                                        color:Color.fromRGBO(69, 95, 185, 1) ,
                                        size: screenWidth(20),
                                        ),
                                      ),
                                      Padding(
                                       padding: EdgeInsetsDirectional.only(start: screenWidth(45),end: screenWidth(45)),
                                        child: Text('${cart.cartList[index].qty}'),
                                      ),
                                      InkWell(
                                        onTap: (){
                                           cart.changeQty(model: cart.cartList[index], incress: false);
                                        },
                                        child: Icon(Icons.remove_circle,
                                                        color: Color.fromRGBO(69, 95, 185, 1),
                                                         size: screenWidth(20),
                                        ),
                                      )
                                    ],),
                        ),
                                
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(bottom: screenWidth(3.5),),
                      child: InkWell(
                        onTap: (){
                          cart.removeFromCartList(cart.cartList[index]);

                        },
                        child: Icon(Icons.backspace,
                        color: Colors.red,
                        
                        ),
                      ),
                    )
              
                  ],
                ),);
                               
             }
            );
        }),  CustomDivider(color:AppColors.blue),
                    Obx(() {
                      return  Padding(
                        padding: EdgeInsetsDirectional.only(start: screenWidth(23),end: screenWidth(23)),
                        child: Column(
                                      children: [
                                        CustomRow(name: 'Sub Total', text: '${cart.subTotal.value}'),
                                      CustomDivider(),
                                       CustomRow(name: 'Tax:', text: '${cart.taxAmount.value}'),
                                       CustomDivider(),
                                        CustomRow(name: 'Delivery Fees:', text: '${cart.deliveryFees.value}'),
                                         CustomDivider(),
                                          CustomRow(name: 'Total:', text: '${cart.total.value}'),
                                        
                                      ],
                                    ),
                      );
                    }),
                     CustomDivider(color:AppColors.blue),
                      InkWell(
                        onTap: (){
                          Get.off(()=>CheckoutView());
                        },
                        child: Container(
                                   // width: screenWidth(),
                                    height: screenWidth(10),
                                   margin: EdgeInsetsDirectional.only(top: screenWidth(15),end: screenWidth(3),bottom: screenWidth(15)),
                                    padding: EdgeInsetsDirectional.only(start: screenWidth(8),top: screenWidth(70)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color.fromRGBO(69, 95, 185, 1),
                                    ),
                                    child: 
                                    CustomText(text: 'Placed Order',
                                    styleType: TextStyleType.BUTTON,
                                    fontSize: screenWidth(18),
                                    )
                                   
                                  ),
                      ),
        ]),
      ),
        ),
    );
    
    
  }
}