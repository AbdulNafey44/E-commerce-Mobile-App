
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';


class UBottomAddToCart extends StatelessWidget {
  const UBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
       color: dark? UColors.darkerGrey : UColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(USizes.cardRadiusLg),
          topRight: Radius.circular(USizes.cardRadiusLg),
        )
      ),
      padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace, vertical: USizes.defaultSpace /2),
      child: Row(
        children: [
          /// Decriment Button
          UCircularIcon(icon: Iconsax.minus, backgroundColor: UColors.darkGrey, width: 40, height: 40, color: UColors.white),
          SizedBox(width: USizes.spaceBtwItems),
          /// Counter
          Text('2',style: Theme.of(context).textTheme.titleMedium),
          SizedBox(width: USizes.spaceBtwItems),
          /// Add Button
          UCircularIcon(icon: Iconsax.add, backgroundColor: UColors.black, width: 40, height: 40, color: UColors.white,),
          Spacer(),
          /// Add To Cart Button
          ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(padding: EdgeInsets.all(USizes.md), backgroundColor: UColors.black,side: BorderSide(color: UColors.black)), child: Row(
            children: [
              Icon(Iconsax.shopping_bag),
              SizedBox(width: USizes.spaceBtwItems /2,),
              Text('Add To Cart'),
            ],
          )),
        ],
      ),
    );
  }
}
