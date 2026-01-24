import 'package:e_commerce/common/widgets/screens/success_screen.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/helpers/device_helpers.dart';
import '../../style/padding.dart';
import '../button/elevated_button.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

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
              UElevatedButton(onPressed: (){}, child: Text(UText.uContinue)),
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
