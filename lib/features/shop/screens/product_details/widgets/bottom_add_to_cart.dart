import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/features/shop/controller/cart/cart_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../models/product_model.dart';

class UBottomAddToCart extends StatelessWidget {
  const UBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    final controller = CartController.instance;

    controller.updateAlreadyAddedProductCount(product);
    return Container(
      decoration: BoxDecoration(
        color: dark ? UColors.darkerGrey : UColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(USizes.cardRadiusLg),
          topRight: Radius.circular(USizes.cardRadiusLg),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: USizes.defaultSpace,
        vertical: USizes.defaultSpace / 2,
      ),
      child: Obx(
        () => Row(
          children: [
            /// Decriment Button
            UCircularIcon(
              icon: Iconsax.minus,
              backgroundColor: UColors.darkGrey,
              width: 40,
              height: 40,
              color: UColors.white,
              onPressed:  controller.productQuantityInCart.value < 1 ? null : () => controller.productQuantityInCart.value -= 1,
            ),
            SizedBox(width: USizes.spaceBtwItems),

            /// Counter
            Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleMedium),
            SizedBox(width: USizes.spaceBtwItems),

            /// Add Button
            UCircularIcon(
              icon: Iconsax.add,
              backgroundColor: UColors.black,
              width: 40,
              height: 40,
              color: UColors.white,
              onPressed: () => controller.productQuantityInCart += 1,
            ),
            Spacer(),

            /// Add To Cart Button
            ElevatedButton(
              onPressed:  controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(USizes.md),
                backgroundColor: UColors.black,
                side: BorderSide(color: UColors.black),
              ),
              child: Row(
                children: [
                  Icon(Iconsax.shopping_bag),
                  SizedBox(width: USizes.spaceBtwItems / 2),
                  Text('Add To Cart'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
