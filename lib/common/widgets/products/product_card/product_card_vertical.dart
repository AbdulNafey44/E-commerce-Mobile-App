import 'package:e_commerce/common/widgets/customeshape/rounded_container.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';

import 'package:e_commerce/common/widgets/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';

import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/screens/product_details/product_details.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../style/shadow.dart';
import '../../text/product_price_text.dart';
import '../../text/product_title_text.dart';

class UProductCard extends StatelessWidget {
  const UProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(()=>ProductDetailsScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: UShadow.verticalProductShadow,
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
          color: dark ? UColors.darkerGrey : UColors.white,
        ),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            URoundedContainer(
              height: 180,
              padding:  const EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.light,

              child: Stack(
                children: [
                  /// thumbnail
                  Center(child: URoundedImage(imageUrl: UImages.productImage15,)),
                  ///discount tag
                  Positioned(
                    top: 12.0,
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
            SizedBox(height: USizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.only(left: USizes.sm),
              child: Column(
                children: [
                  ///product title
                  UProductTitleText(title: 'Blue Bata Shoes', smallSize: true),
                  SizedBox(height: USizes.spaceBtwItems / 2,),
                  ///brand brand
                  Row(
                    children: [
                      UBrandTitleWithverifyIcon(title: 'Bata'),
                    ],
                  ),

                  ///...product price ...//
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UProductPriceText(price: '120',),
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
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}