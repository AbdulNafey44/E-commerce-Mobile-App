import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../screens/forgetpassword/reset_password.dart';

class ForgetPasswordController extends GetxController{
   static ForgetPasswordController get instance => Get.find();


   /// Variables
   final email = TextEditingController();


   final forgetPasswordFormKey =GlobalKey<FormState>();

   /// send forget password email

  Future<void> sendPasswordResetEmail() async {
    try{
      // start loading 
      UFullScreenLoader.openLoadingDialog('Processing your request...');
      // check internet connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }
      // form validate
      if(!forgetPasswordFormKey.currentState!.validate()){
        UFullScreenLoader.stopLoading();
        return;
      }
      // send email to reset password
       AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
      // stop loading
      UFullScreenLoader.stopLoading();
      // success message
      USnackBarHelpers.successSnackBar(title: 'Email Sent', message: 'Email link send to reset your password');
      // redirect 
      Get.to(ResetPasswordScreen(email: email.text.trim(),));
    }catch(e){
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Failed Forget Password', message: e.toString());
    }
  }

   Future<void> rsendPasswordResetEmail() async {
     try{
       // start loading
       UFullScreenLoader.openLoadingDialog('Processing your request...');
       // check internet connectivity
       bool isConnected = await NetworkManager.instance.isConnected();
       if(!isConnected){
         UFullScreenLoader.stopLoading();
         USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
         return;
       }
       // send email to reset password
       AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
       // stop loading
       UFullScreenLoader.stopLoading();
       // success message
       USnackBarHelpers.successSnackBar(title: 'Email Sent', message: 'Email link send to reset your password');
       // redirect

     }catch(e){
       UFullScreenLoader.stopLoading();
       USnackBarHelpers.errorSnackBar(title: 'Failed Forget Password', message: e.toString());
     }
   }
}