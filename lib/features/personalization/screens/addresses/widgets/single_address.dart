import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/customeshape/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';

class USingleAddress extends StatelessWidget {
  const USingleAddress({
    super.key, required this.isSelected,
  });
 final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    return URoundedContainer(
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
              Text('Abdul Nafey',style: Theme.of(context).textTheme.titleLarge,maxLines: 1,overflow: TextOverflow.ellipsis),
              SizedBox(height: USizes.spaceBtwItems /2,),
              /// Phone Number
              Text('+923058135026', maxLines: 1,overflow: TextOverflow.ellipsis),
              SizedBox(height: USizes.spaceBtwItems /2,),
              /// Address
              Text('House No.295, Punjab, Pakpattan, Pakistan'),

            ],
          ),
          if(isSelected) Positioned(
            right: 6,
              top: 0,
              bottom: 0,
              child: Icon(Iconsax.tick_circle5)),
        ],
      )
    );
  }
}