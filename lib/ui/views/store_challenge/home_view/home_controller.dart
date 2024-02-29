import 'package:e_commerc/core/data/models/product_info.dart';
import 'package:e_commerc/core/data/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxList<String> allcategory=<String>[].obs;
  RxList<ProductModel> allproduct=<ProductModel>[].obs;
  RxString cate='All'.obs;
  @override
  void onInit() {
    allproducts();
//  getCategories(); 
// getProductbyCategory();   
super.onInit();
  }
  getCategories(){
  allcategory.clear();
    ProductRepository().getAllCategory().then((value) {
value.fold((l) => Text('no data'), (r){
allcategory.addAll(r);
}
);
});
}
allproducts(){
    ProductRepository().getAllProduct().then((value){
        value.fold((l) => null, (r){
          allproduct.addAll(r);
        }
        );
       });
}
getProductbyCategory(){
  allproduct.clear();
  if(cate.value=='All'){
    allproducts();
    return;
  }
  else{ProductRepository().getProductByCategory(cate.value).then((value) {
    value.fold((l) {
      Text('no data');
    }, (r) {
      allproduct.addAll(r);
    });
  });}
}
}