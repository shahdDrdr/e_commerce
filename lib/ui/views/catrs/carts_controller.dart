import 'package:e_commerc/core/data/models/product_info.dart';
import 'package:e_commerc/core/data/repository/product_repository.dart';

import 'package:get/get.dart';

class CartsController extends GetxController{
  RxList<ProductModel> allproduct=<ProductModel>[].obs;
 RxInt index=1.obs;
 RxBool isloading=true.obs;
 void onInit(){
  if(index.value==1)
  ProductRepository().getAllProduct().then((value){
        value.fold((l) => null, (r){
          allproduct.addAll(r);
        }
        );
       });
   super.onInit();
 }


}