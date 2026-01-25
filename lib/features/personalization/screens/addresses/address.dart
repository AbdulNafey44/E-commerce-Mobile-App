import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/personalization/screens/addresses/widgets/single_address.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import 'add_new_address.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///....[App Bar]...///
      appBar: UAppBar(
        showBackArrow: true, title: Text('Addresses', style: Theme.of(context).textTheme.headlineMedium),
        ///....[Body]...
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPading.screenPading,
          child: Column(
            children: [
              USingleAddress(isSelected: true),
              SizedBox(height: USizes.spaceBtwItems),
              USingleAddress(isSelected: false),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=> Get.to(AddNewAddressScreen()), child: Icon(Iconsax.add, color: UColors.white), backgroundColor: UColors.primary),
    );
  }
}


