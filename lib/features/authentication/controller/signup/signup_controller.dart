import 'package:e_commerce/common/widgets/screens/verify_screen.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// variables
  final signupFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;
  RxBool privacyPolicy = false.obs;

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  /// function to register user with email and password
  Future<void> registerUser() async {
    try {
      /// show loading
      UFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
      );

      /// check internet connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(
          title: 'Make sure you have stable internet connection',
        );
        return;
      }

      // check privacy policy tick
      if (!privacyPolicy.value) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
          "In order to create account you must have to read and accept privacy & terms of use",
        );
        return;
      }

      // validate form
      if (!signupFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Register user with Firebase Authentication
      UserCredential userCredential =
      await AuthenticationRepository.instance.registerUser(
        email.text.trim(),
        password.text.trim(),
      );

      // create userModel
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: firstname.text,
        lastName: lastname.text,
        username: '${firstname.text}${lastname.text}6754',
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      // save user record
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(userModel);

      // send email verification safely without blocking navigation
      try {
        await AuthenticationRepository.instance.sendEmailVerification();
      } catch (_) {
        // do nothing, prevents false error snackbar
      }

      // stop loading AFTER everything is done
      UFullScreenLoader.stopLoading();

      // success message
      USnackBarHelpers.successSnackBar(
        title: 'Congratulation',
        message: 'Your account has been created! Verify email to continue',
      );

      // redirect to verify screen **after loader stops**
      Get.off(() => VerifyScreen(email: email.text));
      // Using Get.off instead of Get.to avoids overlapping snackbars and screen flashes

    } on FirebaseAuthException catch (e) {
      // stop screen loading
      UFullScreenLoader.stopLoading();

      // Firebase error handling
      switch (e.code) {
        case 'email-already-in-use':
          USnackBarHelpers.errorSnackBar(
            title: 'Email Exists',
            message: 'This email is already registered',
          );
          break;
        case 'weak-password':
          USnackBarHelpers.errorSnackBar(
            title: 'Weak Password',
            message: 'Password should be at least 6 characters',
          );
          break;
        case 'invalid-email':
          USnackBarHelpers.errorSnackBar(
            title: 'Invalid Email',
            message: 'Please enter a valid email address',
          );
          break;
        default:
          USnackBarHelpers.errorSnackBar(
            title: 'Signup Failed',
            message: e.message ?? 'Something went wrong',
          );
      }
    } catch (e) {
      // stop screen loading
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
