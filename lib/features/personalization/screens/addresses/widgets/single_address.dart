import 'package:e_commerce/features/personalization/controller/address_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/customeshape/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/address_model.dart';

class USingleAddress extends StatelessWidget {
  const USingleAddress({
    super.key,  required this.address, required this.onTap,
  });
  final AddressModel address;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    final controller = AddressController.instance;
    return Obx(() {
      String selectedAddressId = controller.selectedAddress.value.id;
      bool isSelected = selectedAddressId == address.id;

      return  InkWell(
        onTap: onTap,
        child: URoundedContainer(



            width: double.infinity,
            showBorder: true,
            backgroundColor: isSelected? UColors.primary.withValues(alpha: 0.4) : Colors.transparent,
            borderColor: isSelected? Colors.transparent : dark ? UColors.darkerGrey : UColors.grey,
            padding: EdgeInsets.all(USizes.md),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Name
                    Text( address.name ,style: Theme.of(context).textTheme.titleLarge,maxLines: 1,overflow: TextOverflow.ellipsis),
                    SizedBox(height: USizes.spaceBtwItems /2,),
                    /// Phone Number
                    Text(address.phoneNumber, maxLines: 1,overflow: TextOverflow.ellipsis),
                    SizedBox(height: USizes.spaceBtwItems /2,),
                    /// Address
                    Text(address.toString()),

                  ],
                ),
                if(isSelected) Positioned(
                    right: 6,
                    top: 0,
                    bottom: 0,
                    child: Icon(Iconsax.tick_circle5)),
              ],
            )
        ),
      );
    });
  }
}