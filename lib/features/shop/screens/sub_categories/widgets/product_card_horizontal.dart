import 'package:e_commerce/common/widgets/button/add_to_cart_button.dart';
import 'package:e_commerce/common/widgets/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce/common/widgets/text/product_price_text.dart';
import 'package:e_commerce/common/widgets/text/product_title_text.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/customeshape/rounded_container.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../common/widgets/products/favourite/favourite_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controller/product/product_controller.dart';
import '../../product_details/product_details.dart';


class UProductCardHorizontal extends StatelessWidget {
  const UProductCardHorizontal({
    super.key, required this.product,

  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    final controller = ProductController.instance;
    String? salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    return GestureDetector(
      onTap: () => Get.to(()=>ProductDetailsScreen(product: product,)),
      child: Container(
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
                      child: URoundedImage(imageUrl: product.thumbnail, isNetworkImage: true)),
                  ///discount tag
                  if(salePercentage != null)
                  Positioned(
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
                    child: UFavouriteIcon(productId: product.id),
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
                        UProductTitleText(title: product.title, smallSize: true),
                        SizedBox(height: USizes.spaceBtwItems/2),
                        /// brand name
                        UBrandTitleWithverifyIcon(title: product.brand!.name),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// product price
                        Flexible(child: UProductPriceText(price: controller.getProductPrice(product))),
                        ///add btn
                       ProductAddToCartButton(product: product),
                      ],
                    )
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}