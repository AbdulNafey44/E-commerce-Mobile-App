import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{

  static LoginController get instance => Get.find();


  /// variables
  final _userController = Get.put(userController());
  final email = TextEditingController();
  final password = TextEditingController();
  RxBool isPasswordVisible = false.obs;
  RxBool isRememberMe = false.obs;
  final loginFormKey = GlobalKey<FormState>();

  final localStorage = GetStorage();


  @override
  void onInit() {
    email.text = localStorage.read(UKeys.rememberMeEmail) ?? '';
    password.text = localStorage.read(UKeys.rememberMePassword) ?? '';
  }

  Future<void> loginWithEmailAndPassword() async {

     try{

       /// start loading
       UFullScreenLoader.openLoadingDialog('logging you in...');

       /// check internet connectivity
       final isConnected = await NetworkManager.instance.isConnected();
       if(!isConnected){
         UFullScreenLoader.stopLoading();
         USnackBarHelpers.warningSnackBar(title: 'No internet connection');
         return;
       }
       if(!loginFormKey.currentState!.validate()) {
         UFullScreenLoader.stopLoading();
         return;
       }
       /// save data is rememberMe checked
       if(isRememberMe.value){
         localStorage.write(UKeys.rememberMeEmail, email.text.trim());
         localStorage.write(UKeys.rememberMePassword, password.text.trim());
       }

      /// login user with email and password
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
       // stop loading
       UFullScreenLoader.stopLoading();
       // redirect
       AuthenticationRepository.instance.screenRedirect();
     }catch(e){
       UFullScreenLoader.stopLoading();
       USnackBarHelpers.errorSnackBar(title: 'Login Failed', message: e.toString());
     }
   }
   Future<void> googleSignIn() async {
    try{
      /// start loading
      UFullScreenLoader.openLoadingDialog('logging you in...');

      /// check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No internet connection');
        return;
      }
      /// authenticate with google
     UserCredential userCredential =   await  AuthenticationRepository.instance.signInWithGoogle();
      /// save user record
     await _userController.saveUserRecord(userCredential);

      /// stop loading
      UFullScreenLoader.stopLoading();
      ///  Redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      /// stop loading
      UFullScreenLoader.stopLoading();
      // Error Snack bar
      USnackBarHelpers.errorSnackBar(title: 'Login Failed', message: e.toString() );
    }
   }
}