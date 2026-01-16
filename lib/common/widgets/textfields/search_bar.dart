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
    return Positioned(
      bottom: 0,
      right: USizes.spaceBtwSections,
      left: USizes.spaceBtwSections,
      child: Container(
        height: 60,
        padding: EdgeInsetsGeometry.symmetric(horizontal: USizes.md),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(USizes.borderRadiusLg),
            color: UColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                spreadRadius: 2.0,
                blurRadius: 4.0,
              ),

            ]
        ),
        child: Row(
          children: [
            Icon(Iconsax.search_normal, color: UColors.darkerGrey,),
            SizedBox(width: USizes.spaceBtwItems),
            Text( UText.searchTitle , style: Theme.of(context).textTheme.bodySmall,),
          ],
        ),
      ),
    );
  }
}