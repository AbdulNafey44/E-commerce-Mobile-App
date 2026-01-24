import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {

  static AuthenticationRepository get instance => Get.find();
   final storage = GetStorage();
  @override
  void onReady() {
    FlutterNativeSplash.remove();

    screenRedirect();
  }

  void screenRedirect() {
  storage.writeIfNull('isFirstTime', true);

  storage.read('isFirstTime') == true ? Get.to(() => Onboarding()) : Get.to (() => LoginScreen());
  }
  
}