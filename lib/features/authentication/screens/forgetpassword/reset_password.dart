import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => LoginScreen()),
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPading.screenPading,
          child: Column(
            children: [
              //..Image..//
              Image.asset(
                UImages.mailSentImage,
                height: UDeviceHelper.getScreenWidth(context) * 0.4,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              //..Title..//
              Text(UText.resetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(height: USizes.spaceBtwItems),
              //..Email..//
              Text('example@gmail.com', style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: USizes.spaceBtwItems),
              //..Subtitle..//
              Text(UText.resetPasswordSubTitle, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center,),
              SizedBox(height: USizes.spaceBtwSections),
              //..Done..//
              UElevatedButton(onPressed: (){}, child: Text(UText.resetPasswordDone)),
              SizedBox(height: USizes.spaceBtwItems),
              //..Resend Email..//
              SizedBox(
                width: double.infinity,
                  child: TextButton(onPressed: (){}, child: Text(UText.resetPasswordResendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
