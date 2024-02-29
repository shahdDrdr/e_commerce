import 'package:get/get.dart';

class ProductController extends GetxController{
  RxInt count =1.obs;
  @override
  void onInit() {
  
    super.onInit();
  }
  @override
  void onClose() {
    
    count.value=1;
    super.onClose();
  }
}