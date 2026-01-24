import 'package:e_commerce/common/widgets/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce/common/widgets/text/product_price_text.dart';
import 'package:e_commerce/common/widgets/text/product_title_text.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/customeshape/rounded_container.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';


class UProductCardHorizontal extends StatelessWidget {
  const UProductCardHorizontal({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(USizes.productImageRadius),
        color: dark ? UColors.darkerGrey : UColors.light,
      ),
      child: Row(
        children: [
          /// left portion
          URoundedContainer(
            height: 120,
            padding: EdgeInsets.all(USizes.md),
            backgroundColor: dark ? UColors.dark : UColors.light,
            child: Stack(
              children: [
                /// Thumbnail
                SizedBox(
                    width : 120,
                    height: 120,
                    child: URoundedImage(imageUrl: UImages.productImage15)),
                ///discount tag
                Positioned(
                  child: URoundedContainer(
                    radius: USizes.sm,
                    backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                    padding: const EdgeInsets.symmetric(horizontal: USizes.sm, vertical: USizes.xs),
                    child: Text('20%', style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black)),
                  ),
                ),
                ///Favourite btn
                Positioned(
                  right: 0,
                  top: 0,
                  child: UCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                ),
              ],
            ),
          ),

          /// right portion
          SizedBox(
            width: 150,
            child: Padding(
              padding: EdgeInsets.only(left: USizes.sm, top: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// product title
                      UProductTitleText(title: 'Blue Bata Shoes', smallSize: true),
                      SizedBox(height: USizes.spaceBtwItems/2),
                      UBrandTitleWithverifyIcon(title: 'Bata'),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: UProductPriceText(price: '145')),
                      ///add btn
                      Container(
                        width: USizes.iconLg * 1.2,
                        height: USizes.iconLg * 1.2,
                        decoration: BoxDecoration(
                            color: UColors.primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(USizes.cardRadiusMd),
                              bottomRight: Radius.circular(USizes.productImageRadius),
                            )
                        ),
                        child: Icon(Iconsax.add, color: UColors.white),
                      ),
                    ],
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}