import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/authentication/screens/forgetpassword/reset_password.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPading.screenPading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //...Title...//
              Text(
                UText.forgetPassword,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwItems,),
              ///subtitle...//
              Text(
                UText.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: USizes.spaceBtwSections * 2),

              ///...Email Field...//
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: UText.signUpEmail,
                      prefixIcon: Icon(Iconsax.direct_right),
                    ),
                  ),
                ],
              ),
              SizedBox(height: USizes.spaceBtwInputFields),
              ///...submit button...//
              UElevatedButton(
                onPressed: () => Get.to(() => ResetPasswordScreen()),
                child: Text(UText.forgetPasswordSubmit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
