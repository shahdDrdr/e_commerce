import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerc/core/data/repository/shared_prefrence_repository.dart';
import 'package:e_commerc/core/services/cart_servic.dart';
import 'package:e_commerc/core/services/connectivity_serivce.dart';
import 'package:e_commerc/ui/views/catrs/carts_controller.dart';
//import 'package:e_commerc/ui/views/main_view/home_view/home_controller.dart';
//import 'package:e_commerc/ui/views/intro_view/intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerc/app/my_app.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void>main() async {
  WidgetsFlutterBinding.ensureInitialized();
   //! Get.put(SharedPrefrenceRepository());
  Get.lazyPut(
    () => SharedPrefrenceRepository(),
  );
  Get.lazyPut(
    () => CartsController(),
  );
    Get.lazyPut(
    () => CartService(),
  );
 
  
  
   Get.put(ConnectivitySerivce());
  Get.put(Connectivity());
  await Get.putAsync<SharedPreferences>(
    () async {
      return await SharedPreferences.getInstance();
    },
  );
  runApp(const MyApp());
}
