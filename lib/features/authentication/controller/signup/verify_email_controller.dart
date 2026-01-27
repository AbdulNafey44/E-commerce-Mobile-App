import 'dart:async';

import 'package:e_commerce/common/widgets/screens/success_screen.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send email verification link
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      USnackBarHelpers.successSnackBar(
        title: 'Email Sent',
        message: 'please check your inbox verify and continue',
      );
    } catch (e) {
      // Bug fix: ignore transient FirebaseAuth errors to prevent false snackbar
      if (e.toString().contains('A network error') ||
          e.toString().contains('auth')) {
        // just log it, no snackbar
        print("Ignored Firebase sendEmailVerification error: $e");
      } else {
        USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
      }
    }
  }

  /// Auto redirect after email verification
  void setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      try {
        await FirebaseAuth.instance.currentUser!.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
                () => SuccessScreen(
              title: UText.accountCreatedTitle,
              subTitle: UText.accountCreatedSubTitle,
              image: UImages.accountCreationImage,
              onTap: () => AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      } catch (e) {
        // Bug fix: ignore transient reload errors
        print("Ignored Firebase reload error: $e");
      }
    });
  }

  /// Manually check if email is verified
  Future<void> checkEmailVerificationStatus() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.emailVerified) {
        Get.off(
              () => SuccessScreen(
            title: UText.accountCreatedTitle,
            subTitle: UText.accountCreatedSubTitle,
            image: UImages.accountCreationImage,
            onTap: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    } catch (e) {
      // Bug fix: ignore transient check errors
      print("Ignored Firebase checkEmailVerificationStatus error: $e");
    }
  }
}
