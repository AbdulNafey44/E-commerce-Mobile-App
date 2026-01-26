import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/authentication/controller/forgetpassword/forget_password_controller.dart';
import 'package:e_commerce/features/authentication/screens/forgetpassword/reset_password.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
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
                  Form(
                    key: controller.forgetPasswordFormKey,
                    child: TextFormField(
                      controller: controller.email,
                      validator: (value) => UValidator.validateEmail(value),
                      decoration: InputDecoration(
                        labelText: UText.signUpEmail,
                        prefixIcon: Icon(Iconsax.direct_right),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: USizes.spaceBtwInputFields),
              ///...submit button...//
              UElevatedButton(
                onPressed: controller.sendPasswordResetEmail,
                child: Text(UText.forgetPasswordSubmit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
