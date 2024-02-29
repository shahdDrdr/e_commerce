import 'package:e_commerc/ui/shared/utils.dart';
import 'package:e_commerc/ui/views/landing_view/landing_view.dart';
import 'package:e_commerc/ui/views/store_challenge/main_view.dart';
//import 'package:e_commerc/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

//import '../landing_view/landing_view.dart';

class SplashController extends GetxController{
  @override
  void onInit(){
    splash();
    super.onInit();
  }
  void splash(){
     Future.delayed(Duration(seconds: 2)).then((value) {
     Get.off(storage.getFirstLunch()
     ?MainView()
     :storage.getLoggedln()
     ?MainView()
     :LandingView()
     
     );
    });
  }
}