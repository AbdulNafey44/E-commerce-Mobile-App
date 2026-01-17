import 'package:e_commerce/common/style/shadow.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';



class USearchBar extends StatelessWidget {
  const USearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunction.isDarkMode(context);
    return Positioned(
      bottom: 0,
      right: USizes.spaceBtwSections,
      left: USizes.spaceBtwSections,
      child: Container(
        height: USizes.searchBarHeight,
        padding: EdgeInsetsGeometry.symmetric(horizontal: USizes.md),
        //...box decoration ...//
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(USizes.borderRadiusLg),
            color: dark ? UColors.dark :  UColors.light,
            boxShadow: UShadow.searchBarShadow,
        ),
        child: Row(
          children: [
            ///...icon...//
            Icon(Iconsax.search_normal, color: UColors.darkerGrey,),
            SizedBox(width: USizes.spaceBtwItems),
            //...Title...///
            Text( UText.searchTitle , style: Theme.of(context).textTheme.bodySmall,),
          ],
        ),
      ),
    );
  }
}