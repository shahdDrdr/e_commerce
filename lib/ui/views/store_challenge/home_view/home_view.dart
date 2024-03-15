
import 'package:e_commerc/ui/shared/colors.dart';
import 'package:e_commerc/ui/shared/shared_widgets/custom_text.dart';
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:e_commerc/ui/views/catrs/carts_view.dart';
import 'package:e_commerc/ui/views/store_challenge/home_view/category_widget.dart';
import 'package:e_commerc/ui/views/store_challenge/home_view/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
class HomeViewChallenge extends StatefulWidget {
  
  const HomeViewChallenge({super.key, });

  @override
  State<HomeViewChallenge> createState() => _HomeViewChallengeState();
}
class _HomeViewChallengeState extends State<HomeViewChallenge> {
   HomeController category=Get.put(HomeController());
    RefreshController _refreshController =
      RefreshController(initialRefresh: false);
   //late String namecategory;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      body: SmartRefresher(
           enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        onRefresh:(){
          category.onInit();
          _refreshController.refreshCompleted();
        } ,
       controller:_refreshController ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Padding(
               padding:  EdgeInsetsDirectional.only(start: screenWidth(15),top: screenWidth(15)),
               child: Align(
                alignment: Alignment.topLeft,
                 child: CustomText(text: 'Categories',
                 styleType: TextStyleType.TITLE,
                 ),
               ),
             ),
             Container(
                 width: screenWidth(1),
                 height: screenWidth(6),
                 child: Obx((){
                 return category.allcategory.isEmpty?
              SizedBox()
                 :
                  Container(
                 width: screenWidth(1),
                 height: screenWidth(20),
                 margin: EdgeInsetsDirectional.only(top: screenWidth(15),start: screenWidth(20)),
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
                         child: CategoryWidget(name: 'All', color: category.cate.value=='All'?Color.fromARGB(255, 106, 188, 255)
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
                        CustomText(text: 'price',
                        styleType: TextStyleType.FOCUSTEXT,
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
             
        
      ),


    );
    
  }
}