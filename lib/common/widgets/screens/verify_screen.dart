
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controller/signup/verify_email_controller.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/helpers/device_helpers.dart';
import '../../style/padding.dart';
import '../button/elevated_button.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.clear),
            onPressed:  AuthenticationRepository.instance.logout,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPading.screenPading,
          child: Column(
            children: [
              Image.asset(
                UImages.mailSentImage,
                height: UDeviceHelper.getScreenWidth(context) * 0.4,
              ),
              const SizedBox(height: USizes.spaceBtwItems),

              Text(
                UText.verifyemail,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: USizes.spaceBtwItems),

              Text(email ?? '', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: USizes.spaceBtwItems),

              Text(
                UText.resetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: USizes.spaceBtwSections),

              UElevatedButton(
                onPressed: controller.checkEmailVerificationStatus,
                child: const Text(UText.uContinue)),
              const SizedBox(height: USizes.spaceBtwItems),

              /// 🔁 Resend Email Button (with cooldown)
               SizedBox(width: double.infinity, child: TextButton(onPressed: controller.sendEmailVerification, child: Text(UText.resendEmail)))
            ],
          ),
        ),
      ),
    );
  }
}
