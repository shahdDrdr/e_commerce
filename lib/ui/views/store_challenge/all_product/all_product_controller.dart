
import 'package:e_commerc/core/data/models/product_info.dart';
import 'package:e_commerc/core/data/repository/product_repository.dart';
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController{
   RxList <ProductModel> result= <ProductModel> [].obs;
  RxBool isLoading =true.obs;
   @override
  void onInit() {
     ProductRepository().getAllProduct().then((value){
        value.fold((l) => null, (r){
         result.addAll(r);
        }
        );
       });
    super.onInit();
  }
  void filter(String word){
    RxList<ProductModel> all=<ProductModel>[].obs;
    
      all.value=product.allproduct.where((element) => element.title!.toLowerCase().contains(word.toLowerCase())).toList();
    
    result.value=all;
  }
}