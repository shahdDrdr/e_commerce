
import 'package:e_commerc/ui/shared/shared_widgets/custom_text.dart';
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:e_commerc/ui/views/store_challenge/all_product/all_product_controller.dart';
import 'package:e_commerc/ui/views/store_challenge/product_details_view/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class AllProductChallenge extends StatefulWidget {
  const AllProductChallenge({super.key});
  @override
  State<AllProductChallenge> createState() => _AllProductChallengeState();
}

class _AllProductChallengeState extends State<AllProductChallenge> {
 AllProductController controller=Get.put(AllProductController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      body:
      Obx(() {
        return  intrnetController.isOnline.value?
       Padding(
        padding:  EdgeInsetsDirectional.only(start: screenWidth(20),top: screenWidth(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Align(
            alignment: Alignment.topLeft,
            child:CustomText(text: 'All Products',
               styleType: TextStyleType.TITLE,
               )
         
          ),
          Obx(() {
            return  
            controller.isLoading.value?
             Container(
            height: screenWidth(10),
            margin: EdgeInsetsDirectional.only(end: screenWidth(20),top: screenWidth(20),bottom: screenWidth(20)),
            child: TextFormField(
              onChanged: (value) => controller.filter(value),
              decoration: InputDecoration(     
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: const Color.fromARGB(255, 244, 54, 158)),
                   borderRadius: BorderRadius.circular(25),
                ),
                prefixIcon: Icon(Icons.search),
                hintText:('Search...'),
                hintStyle: TextStyle(
                  height: 1
                )
              ),)
          ):SpinKitCircle(color: Colors.amber,);
          }),
       
           Expanded(
             child: Obx(() {
              return controller.result.isEmpty?
              SpinKitCircle(color: Colors.amber,)
              :
               Container(
              height: screenWidth(1),
              child: GridView.builder(
                gridDelegate: 
               const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    ),
                    itemCount:controller.result.length,
                itemBuilder: (BuildContext context, index){
                  return 
               InkWell(
                onTap: (){
                   Get.to(()=>ProductDetailsView(products:controller.result[index] ));
                },
                 child: Container(
                  width: screenWidth(3),
                  height: screenWidth(9),
                  margin: EdgeInsetsDirectional.only(bottom: screenWidth(35),end: screenWidth(25)),
                  padding: EdgeInsetsDirectional.only(start: screenWidth(30),top: screenWidth(25)),
                 decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(150, 150, 150,1)),
                  borderRadius: BorderRadius.circular(15)
                 ),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(controller.result[index].image??"",
                    width: screenWidth(8),  
                          height: screenWidth(6),
                    ),
                    Padding(
                      padding:  EdgeInsetsDirectional.only(top: screenWidth(65),bottom: screenWidth(45)),
                      child: Text(controller.result[index].title??"",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      ),
                    ),Row(
                      children: [
                        CustomText(text: 'price',
                        styleType: TextStyleType.FOCUSTEXT,
                        ),
                    Text('${controller.result[index].price??""}')
                      ],
                    )
                   
                  ],
                 ),
                 ),
               );
                }),
              );
               
             }),
           ),
        ]),
      ):Padding(
        padding:  EdgeInsetsDirectional.only(top: screenWidth(1.3)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.wifi_off_outlined,size: screenWidth(3),),
              Text('No internet connection')
            ],
          ),
        ),
      );
      })
  
    )
    );
  }
}
