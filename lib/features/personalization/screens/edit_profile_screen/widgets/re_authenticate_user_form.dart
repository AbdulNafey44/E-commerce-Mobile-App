import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticateUserForm extends StatelessWidget {
  const ReAuthenticateUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = userController.instance;
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('Re-Authenticate User')),

      body: SingleChildScrollView(
        child: Padding(padding: UPading.screenPading,
         child: Form(
           key: controller.reAuthFormKey,
            child: Column(
            children: [
              /// Email
              TextFormField(
                controller: controller.email,
                validator: UValidator.validateEmail,
                decoration: InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: UText.email),
                
              ),
              SizedBox(height: USizes.spaceBtwInputFields),
              /// Password
              Obx(
                () =>  TextFormField(
                  controller: controller.password,
                  obscureText: controller.isPasswordVisible.value,
                  validator: (value) => UValidator.validateEmptyText('[assword', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: UText.password,
                    suffixIcon: IconButton(onPressed: controller.isPasswordVisible.toggle, icon: Icon(controller.isPasswordVisible.value ? Iconsax.eye : Iconsax.eye_slash )),
                  ),

                ),
              ),
              SizedBox(height: USizes.spaceBtwSections),
              /// Verify Button
              UElevatedButton(onPressed: controller.reAuthenticateUser, child: Text('Verify')),

          ],
        ) ),
        ),
      ),
    );
  }
}
