

import 'package:e_commerc/core/services/connectivity_serivce.dart';
import 'package:get/get.dart';

import '../../../shared/utils.dart';

class CheckConnection extends GetxController{
  RxBool isOnline = true.obs;

  @override
  void onInit() {
    checkConnection();
    super.onInit();
  }

  void checkConnection() {
    connectivitySerivce.connectivityStatusController.stream.listen((event) {
      isOnline.value = event == ConnectivityStatus.ONLINE;

      //! if (event == ConnectivityStatus.ONLINE)
      //!   isOnline.value = true;
      //! else
      //!   isOnline.value = false;
    });
  }

}