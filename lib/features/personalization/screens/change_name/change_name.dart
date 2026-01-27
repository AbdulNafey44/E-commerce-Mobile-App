import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/personalization/controller/change_name_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final controller =  Get.put(ChangeNameController());
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('Update Name', style: Theme.of(context).textTheme.headlineMedium)),

      body: SingleChildScrollView(

        child: Padding(
          padding: UPading.screenPading,
          child: Column(
            children: [
              Text(UText.changeNameSubtitle, style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: USizes.spaceBtwSections),
              Form(
                key: controller.updateUserFormKey,
                child: Column(
                  children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: (value) => UValidator.validateEmptyText('First Name', value),
                  decoration: InputDecoration(
                    labelText: UText.firstName, prefixIcon: Icon(Iconsax.user)),
                ),

                SizedBox(height: USizes.spaceBtwInputFields),
                TextFormField(
                    controller: controller.lastName,
                    validator: (value) => UValidator.validateEmptyText('Last Name', value),
                    decoration: InputDecoration(
                      labelText: UText.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),

                    SizedBox(height: USizes.spaceBtwSections),
                    UElevatedButton(onPressed: controller.updateUserName, child: Text('Save')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
