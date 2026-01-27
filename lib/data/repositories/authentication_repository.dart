

import 'package:e_commerce/common/widgets/screens/verify_screen.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
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
import 'package:google_sign_in/google_sign_in.dart';


import '../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  final localstorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

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

  /// [Authentication] //// ... sign in
  Future<UserCredential> loginWithEmailAndPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
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

  /// [GoogleAuthentication] //// ... Google sign in
  Future<UserCredential> signInWithGoogle() async {
    try {
    // show popup to select google account
      final GoogleSignInAccount? googleAccount = await GoogleSignIn().signIn();

      // Get the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleAccount?.authentication;

      // create credentials
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      // sign in using credentials
      UserCredential userCredential = await _auth.signInWithCredential(credential);
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
      throw 'Something went wrong. Please try again.';
    }
  }



  /// [EmailVerification] //// -- send mail
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


  /// [ForgetPassword] //// -- send mail for password reset
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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


  /// [ForgetPassword] //// -- send mail for password reset
  Future<void> reAuthenticateUserWithEmailAndPassword(String email, String password) async {
    try {
     AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

     await currentUser!.reauthenticateWithCredential(credential);
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

  //// [Logout] //// --- logout use
  Future<void> logout() async {

    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
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

  //// [Delete] /// Delete user Account

  Future<void> deleteAccount() async {
    try{
      await UserRepository.instance.removeUserRecord(currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
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