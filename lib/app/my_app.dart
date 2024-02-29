
import 'package:e_commerc/core/services/connectivity_serivce.dart';
import 'package:e_commerc/core/translation/app_translation.dart';
import 'package:e_commerc/ui/shared/utils.dart';
import 'package:e_commerc/ui/views/splash_view/splash_view.dart';
import 'package:e_commerc/ui/views/store_challenge/main_view.dart';
//import 'package:e_commerc/ui/views/catrs/carts_view.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your applicatip؛on.
  @override
  Widget build(BuildContext context) {
  // MyAppController controller=Get.put(MyAppController());
    return StreamProvider<ConnectivityStatus>(
      create: (context)=>connectivitySerivce.connectivityStatusController.stream,
      initialData: ConnectivityStatus.OFFLINE,
      child: GetMaterialApp(
         locale: getLocal(),
        translations: AppTranslation(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          useMaterial3: true,
        ),
        home:SplashView(),
      ),
    );
  }
}
Locale getLocal() {
    String langCode = storage.getAppLanguage();
    if (langCode == 'ar')
      return Locale('ar', 'SA');
    else if (langCode == 'en')
      return Locale('en', 'US');
    else
      return Locale('fr', 'FR');
  }

