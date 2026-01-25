

import 'package:e_commerce/common/widgets/screens/verify_screen.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/utils/exceptions/format_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final localstorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();


    screenRedirect();
  }

  void screenRedirect() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      /// check if user is verified
      if (user.emailVerified) {
        // if verified, go to navigation menu
        Get.offAll(NavigationMenu());
      } else {
        // if user not verified, go to verify screen
        Get.offAll(VerifyScreen(email: user.email));
      }
    } else {
      // if no user, check if first time or show login
      localstorage.writeIfNull('isFirstTime', true);
      localstorage.read('isFirstTime') == true
          ? Get.to(() => Onboarding())
          : Get.to(() => LoginScreen());
    }
  }


  /// [Authentication] ////
  Future<UserCredential> registerUser(String email, password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    }
    on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }
    on FormatException catch (_) {
      throw UFormatException();
    }
    on PlatformException catch (e) {
      throw UFormatException(e.code).message;
    }
    catch (e) {
      throw ' Something went Wrong. please try again';
    }
  }

  /// [EmailVerification] ////
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    }
    on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    }
    on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }
    on FormatException catch (_) {
      throw UFormatException();
    }
    on PlatformException catch (e) {
      throw UFormatException(e.code).message;
    }
    catch (e) {
      throw ' Something went Wrong. please try again';
    }
  }

  //// [Logout] ////
  Future<void> logout() async {

    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(LoginScreen());
    }
    on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    }
    on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }
    on FormatException catch (_) {
      throw UFormatException();
    }
    on PlatformException catch (e) {
      throw UFormatException(e.code).message;
    }
    catch (e) {
      throw ' Something went Wrong. please try again';
    }

  }
}