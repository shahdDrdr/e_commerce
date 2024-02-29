import 'package:e_commerc/app/my_app.dart';
//import 'package:e_commerc/core/data/repository/shared_prefrence_repository.dart';
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:get/get.dart';

class LandingContrller extends GetxController{
  List<String> lang=[
    'English',
    'Arabic'
  ];
  void changeLanguage(String code) {
    storage.setAppLanguage(code);
    Get.updateLocale(getLocal());
  }
}