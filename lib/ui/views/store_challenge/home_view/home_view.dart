
import 'package:e_commerc/ui/shared/colors.dart';
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:e_commerc/ui/views/store_challenge/home_view/category_widget.dart';
import 'package:e_commerc/ui/views/store_challenge/home_view/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeViewChallenge extends StatefulWidget {
  
  const HomeViewChallenge({super.key, });

  @override
  State<HomeViewChallenge> createState() => _HomeViewChallengeState();
}

class _HomeViewChallengeState extends State<HomeViewChallenge> {
   HomeController category=Get.put(HomeController());
   late String namecategory;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Align(
            alignment: Alignment.topLeft,
             child: Text('All Products',
              style: TextStyle(
                fontSize: screenWidth(15),fontWeight: FontWeight.bold
              ),
              ),
           ),
           Container(
               width: screenWidth(1),
               height: screenWidth(6),
               child: Obx((){
               return category.allcategory.isEmpty?
            SpinKitCircle(color: Colors.amber,)
               :
                Container(
               width: screenWidth(1),
               height: screenWidth(20),
               margin: EdgeInsetsDirectional.only(top: screenWidth(15)),
               child:ListView.builder(
                 shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                 itemCount:category.allcategory.length,
                 itemBuilder: (BuildContext context,int index){
                  return Obx((){  print(category.cate.value);
                    return index==0?
                     InkWell(
                      onTap: (){
                        category.cate.value='All';
                        category.getProductbyCategory();
                        print(category.cate.value);
                      },
                       child: CategoryWidget(name: 'All', color: category.cate.value=='All'?Color.fromARGB(255, 147, 174, 197)
                       :AppColors.white
                       )
                     ):
                         InkWell(
                          onTap: (){
                            category.cate.value=category.allcategory[index-1];
                            category.getProductbyCategory();
                            print(category.cate);
                          },
                           child: CategoryWidget(name: category.allcategory[index-1], color: AppColors.white)
                         );

                  });
              
                 }
               ));
                       }),
             ),
              
               Expanded(
             child: Obx(() {
               return category.allproduct.length==0
              ? SpinKitCubeGrid(
                color: Colors.amber,
              )
              :   Container(
              height: screenWidth(1),
              margin: EdgeInsetsDirectional.only(start: screenWidth(30),top: screenWidth(15)),
              child: GridView.builder(
                gridDelegate: 
               const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    //childAspectRatio: 3 / 2,
                    //crossAxisSpacing: 1,
                    //mainAxisSpacing:1
                    ),
                    itemCount:category.allproduct.length,
                itemBuilder: (BuildContext context, index){
                  return 
               Container(
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
                  Image.network(category.allproduct[index].image??'',
                  width: screenWidth(8),  
                        height: screenWidth(6),
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(top: screenWidth(65),bottom: screenWidth(45)),
                    child: Text(category.allproduct[index].title??'',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                    ),
                  ),Row(
                    children: [
                       Text('price:',
                       style: TextStyle(
                        color: Colors.blue
                       ),
                       ),
                  Text('${category.allproduct[index].price}')
                    ],
                  )
                 
                ],
               ),
               );
                }),
              );
               
             }),
           ),
             
                   ] ),
             
        
      ),


    );
    
  }
}