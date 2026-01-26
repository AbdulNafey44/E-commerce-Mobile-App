import 'package:e_commerce/features/authentication/controller/login/login_controller.dart';
import 'package:e_commerce/features/authentication/screens/forgetpassword/forget_password.dart';
import 'package:e_commerce/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class ULoginForm extends StatelessWidget {
  const ULoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => UValidator.validateEmail(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: UText.email,
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),
          /// Password
          Obx(
                () => TextFormField(
              controller: controller.password,
              validator: (value) => UValidator.validateEmptyText('password', value),
              obscureText: controller.isPasswordVisible.value,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: UText.password,
                suffixIcon: IconButton(
                  onPressed: () => controller.isPasswordVisible.toggle(),
                  icon: Icon(controller.isPasswordVisible.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                ),
              ),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),
          /// Remember me & forget password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember me
              Obx(
                    () => Row(
                  children: [
                    Checkbox(
                      value: controller.isRememberMe.value,
                      onChanged: (value) =>
                      controller.isRememberMe.toggle(),
                    ),
                    Text(UText.rememberMe),
                  ],
                ),
              ),
              // Forget password
              TextButton(
                  onPressed: () => Get.to(() => ForgetPassword()),
                  child: Text(UText.forgetPassword)),
            ],
          ),
          SizedBox(height: USizes.spaceBtwSections),
          // Signing
          UElevatedButton(
              onPressed: controller.loginWithEmailAndPassword,
              child: Text(UText.signIn)),
          SizedBox(height: USizes.spaceBtwItems / 2),
          // Create account
          SizedBox(
            height: 54,
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () => Get.to(() => SignupScreen()),
                child: Text(UText.createAccount)),
          ),
          SizedBox(height: 1),
        ],
      ),
    );
  }
}
