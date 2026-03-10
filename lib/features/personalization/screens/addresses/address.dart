import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/personalization/controller/address_controller.dart';
import 'package:e_commerce/features/personalization/screens/addresses/widgets/single_address.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/address_model.dart';
import 'add_new_address.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      ///....[App Bar]...///
      appBar: UAppBar(
        showBackArrow: true, title: Text('Addresses', style: Theme.of(context).textTheme.headlineMedium),
        ///....[Body]...
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPading.screenPading,
          child: Obx(
              () => FutureBuilder(
                key: ValueKey(controller.refreshData.value.toString()),
                future: controller.getAllAddress(),
                builder: (context, snapshot) {

                  // handle error, empty , loader
                  final widget = UCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                  if(widget != null) return widget;
                   // data found
                  List<AddressModel> addresses = snapshot.data!;
              return  ListView.separated(
                shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(height: USizes.spaceBtwItems),

                    itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    return USingleAddress( onTap: () => controller.selectAddress(addresses[index]), address: addresses[index]);
                  }, );
                },),
          )

        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=> Get.to(AddNewAddressScreen()), child: Icon(Iconsax.add, color: UColors.white), backgroundColor: UColors.primary),
    );
  }
}


