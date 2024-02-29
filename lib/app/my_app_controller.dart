import 'package:e_commerc/core/services/connectivity_serivce.dart';
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:get/get.dart';

class MyAppController extends GetxController{
  void onInit(){
    checkConnection();
      super.onInit();
  }
void checkConnection() async {
    ConnectivityStatus status =
     connectivitySerivce.getStatus(await connectivity.checkConnectivity());


    connectivitySerivce.connectivityStatusController.add(status);
    isOnline = status == ConnectivityStatus.ONLINE;

    connectivitySerivce.connectivityStatusController.stream.listen((event) {
      isOnline = event == ConnectivityStatus.ONLINE;

      //! if (event == ConnectivityStatus.ONLINE)
      //!   isOnline.value = true;
      //! else
      //!   isOnline.value = false;
    });
  }}
