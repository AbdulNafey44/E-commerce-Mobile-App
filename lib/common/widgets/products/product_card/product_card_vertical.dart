import 'package:e_commerce/common/widgets/customeshape/rounded_container.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';

import 'package:e_commerce/common/widgets/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce/features/shop/controller/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
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
    super.key, required this.product,
  });

  final ProductModel product ;

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    final controller = ProductController.instance;
    String? salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    return GestureDetector(
      onTap: () => Get.to(()=>ProductDetailsScreen(product: product,)),
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
              height: 150,
              padding:  const EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.light,

              child: Stack(
                children: [
                  /// thumbnail
                  Center(child: URoundedImage(imageUrl: product.thumbnail, isNetworkImage: true)),
                  ///discount tag
                  if(salePercentage != null)
                  Positioned(
                    top: 12.0,
                    child: URoundedContainer(
                      radius: USizes.sm,
                      backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                      padding: const EdgeInsets.symmetric(horizontal: USizes.sm, vertical: USizes.xs),
                      child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black)),
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
                  UProductTitleText(title: product.title, smallSize: true),
                  SizedBox(height: USizes.spaceBtwItems / 2,),
                  ///brand brand
                  Row(
                    children: [
                      UBrandTitleWithverifyIcon(title: product.brand!.name),
                    ],
                  ),

                  ///...product price ...//
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UProductPriceText(price: controller.getProductPrice(product)),
                      ///add btn
                      Container(
                        width: USizes.iconLg ,
                        height: USizes.iconLg,
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