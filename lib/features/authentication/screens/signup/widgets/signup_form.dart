import 'package:e_commerce/features/authentication/controller/signup/signup_controller.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/signup_checkbox.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../common/widgets/button/social_button.dart';
import '../../../../../common/widgets/login_signup/form_divider.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class USignupForm extends StatelessWidget {
  const USignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstname,
                  validator: (value) =>
                      UValidator.validateEmptyText('First Name', value),
                  decoration: InputDecoration(
                    labelText: UText.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(width: USizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastname,
                  validator: (value) =>
                      UValidator.validateEmptyText('Last Name', value),
                  decoration: InputDecoration(
                    labelText: UText.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: USizes.spaceBtwSections),

          ///.....email phone password...///
          TextFormField(
            controller: controller.email,
            validator: (value) => UValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: UText.signUpEmail,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields * 1.5),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => UValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: UText.phone,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields * 1.5),
          Obx(
            () => TextFormField(
              obscureText: controller.isPasswordVisible.value,
              controller: controller.password,
              validator: (value) => UValidator.validatePassword(value),
              decoration: InputDecoration(
                labelText: UText.signUpPassword,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.isPasswordVisible.value =
                        !controller.isPasswordVisible.value;
                  },
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),
          //...check box...///
          PrivacyPolicyCheckBox(),
          SizedBox(height: USizes.spaceBtwItems),

          /// create account
          UElevatedButton(
            onPressed: controller.registerUser,
            child: Text(UText.createAccount),
          ),

          SizedBox(height: USizes.spaceBtwSections),
          //....Dividor....///
          UFormDivider(title: UText.orSigupWith),
          SizedBox(height: USizes.spaceBtwSections),
          //...Footer...///
          USocialButtons(),
        ],
      ),
    );
  }
}
