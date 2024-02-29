import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerc/core/data/repository/shared_prefrence_repository.dart';
import 'package:e_commerc/core/services/cart_servic.dart';
import 'package:e_commerc/core/services/connectivity_serivce.dart';
import 'package:e_commerc/ui/views/catrs/carts_controller.dart';
import 'package:e_commerc/ui/views/main_view/check_connection/check_connection_controller.dart';

//import 'package:e_commerc/ui/views/intro_view/intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

double screenWidth(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.width / percent;
  else
    return Get.size.height / percent;
}
double screenHeight(double percent) {
  return Get.size.height / percent;
}
SharedPrefrenceRepository get storage => Get.find<SharedPrefrenceRepository>();
CartsController get product => Get.find<CartsController>();
CartService get cart => Get.find<CartService>();
//CategoryController get category => Get.find<CategoryController>();
Connectivity get connectivity=>Get.find<Connectivity>();
ConnectivitySerivce get connectivitySerivce => Get.find<ConnectivitySerivce>();
bool isOnline = true;
 CheckConnection intrnetController=Get.put(CheckConnection());