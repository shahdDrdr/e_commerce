
import 'package:e_commerc/core/data/models/product_info.dart';

import 'package:e_commerc/ui/shared/utils.dart';
import 'package:e_commerc/ui/views/catrs/carts_view.dart';
import 'package:e_commerc/ui/views/store_challenge/product_details_view/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductDetailsView extends StatefulWidget {
   final ProductModel? products;
   
   ProductDetailsView({super.key,  this.products,});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
ProductController controller=Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(body: 
    Padding(
      padding: EdgeInsetsDirectional.only(start: screenWidth(15),top: screenWidth(15)),
      child: ListView(children: [
        Text(widget.products?.title??"",
        style: TextStyle(
          fontSize: screenWidth(21),
          fontWeight:FontWeight.bold,
          height: 2
        ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(top: screenWidth(20),bottom: screenWidth(22)),
          child: Image.network(widget.products?.image??'',
          width: screenWidth(15),
          height: screenWidth(1.5),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
         Text('Descripition:',
          style: TextStyle(
            color: Color.fromRGBO(69, 95, 185, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold
          ), 
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: screenWidth(25)),
            child: RatingBar.builder(
              itemSize: screenWidth(30),
             initialRating: 3,
             minRating: 1,
             direction: Axis.horizontal,
             allowHalfRating: true,
             itemCount: 5,
             itemPadding: EdgeInsetsDirectional.only(start: screenWidth(35),),
             itemBuilder: (context, _) => Icon(
               Icons.star,
               color: Colors.amber,
             ),
             onRatingUpdate: (rating) {
               print(rating);
             },
          ),
          ),
        ],),
        Text(widget.products?.description??'',
        style: TextStyle(
          fontSize: screenWidth(25)
        ),
        ),
        Padding(
          padding:EdgeInsetsDirectional.only(top: screenWidth(15),bottom: screenWidth(20)),
          child: Row(children: [
            Text('Category:',
            style: TextStyle(
              color: Color.fromRGBO(69, 95, 185, 1),
              fontSize: 20,
                 fontWeight: FontWeight.bold
            ), 
            ),
             Text(widget.products?.category??''),
          ],),
        ),
          Row(children: [
          Text('Price:',
          style: TextStyle(
            color: Color.fromRGBO(69, 95, 185, 1),
            fontSize: 20,
               fontWeight: FontWeight.bold
          ), 
          ),
           Text('${widget.products?.price??''}'),
        ],),
        Row(
          children: [
          InkWell(
            onTap: (){
              cart.addToCart(model: widget.products!, qty: controller.count.value);
             
            },
            child: Container(
              width: screenWidth(2.5),
              height: screenWidth(9),
              margin: EdgeInsetsDirectional.only(top: screenWidth(15)),
              padding: EdgeInsetsDirectional.only(start: screenWidth(16),top: screenWidth(45)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromRGBO(69, 95, 185, 1),
              ),
              child: Text('Add To Cart',
              style: TextStyle(
                color: Colors.white,
                fontSize:screenWidth(22) 
              ),
              ),
            ),
          ),
          Obx(() {
            return  Padding(
            padding: EdgeInsetsDirectional.only(top: screenWidth(20),start: screenWidth(4)),
            child: Row(
              children: [
              InkWell(
                onTap: (){
                  controller.count.value++;
                },
                child: Icon(Icons.add_circle,
                color:Color.fromRGBO(69, 95, 185, 1) ,
                size: screenWidth(10),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: screenWidth(45),end: screenWidth(45)),
                child: Text('${controller.count.value}'),
              ),
              InkWell(
                onTap: (){
                  if(controller.count.value>1)
                  controller.count.value--;
                },
                child: Icon(Icons.remove_circle,
                           color: Color.fromRGBO(69, 95, 185, 1),
                           size: screenWidth(10),
                ),
              )
            ],),
          );
          })
         
        ],)
        
      ]),
    )
    ,)
    
    );
  }
}