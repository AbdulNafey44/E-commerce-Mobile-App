import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/personalization/controller/address_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('Add New Address',  style: Theme.of(context).textTheme.headlineMedium),),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPading.screenPading,
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                 /// Name
               TextFormField(
                 controller: controller.name,
                 validator: (value) => UValidator.validateEmptyText('name', value),
                 decoration: InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name'),),
                SizedBox(height: USizes.spaceBtwInputFields),
                /// Phone Number
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => UValidator.validateEmptyText('phoneNumber', value),
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number'),),
                SizedBox(height: USizes.spaceBtwInputFields),
                Row(children: [
                  /// Street
                  Expanded(child: TextFormField(
                    controller: controller.street,
                    validator: (value) => UValidator.validateEmptyText('street', value),
                    decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'),)),
                  SizedBox(width: USizes.spaceBtwInputFields),
                  /// Postal Code
                  Expanded(child: TextFormField(
                    controller: controller.postalCode,
                    validator: (value) => UValidator.validateEmptyText('postalCode', value),
                    decoration: InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'),)),
                ],),

                SizedBox(height: USizes.spaceBtwInputFields),
                Row(children: [
                  /// City
                  Expanded(child: TextFormField(
                    controller: controller.city,
                    validator: (value) => UValidator.validateEmptyText('city', value),
                    decoration: InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'),)),
                  SizedBox(width: USizes.spaceBtwInputFields),
                  /// State
                  Expanded(child: TextFormField(
                    controller: controller.state,
                    validator: (value) => UValidator.validateEmptyText('state', value),
                    decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'),)),
                ],),
                SizedBox(height: USizes.spaceBtwInputFields),
                /// Country
                TextFormField(
                  controller: controller.country,
                  validator: (value) => UValidator.validateEmptyText('country', value),
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country'),),
                SizedBox(height: USizes.spaceBtwSections),
                /// Save Button
                UElevatedButton(onPressed: controller.addNewAddress, child: Text('Save')),


              ],
            ),
          ),
        ),
      ),
    );
  }
}


