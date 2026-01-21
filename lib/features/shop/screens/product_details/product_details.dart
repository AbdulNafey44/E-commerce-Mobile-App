import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce/common/widgets/text/product_price_text.dart';
import 'package:e_commerce/common/widgets/text/product_title_text.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_thumbnail_and_slider.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/customeshape/rounded_container.dart';
import '../../../../common/widgets/images/circular_image.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return Scaffold(
      ///...[Body]...///
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///...[product image with slider]...///
            UProductThumbnailAndSlider(),
           Padding(
             padding: UPading.screenPading,
             child: Column(
               children: [
                 /// product details ///
                 /// price, titl, stock and brand
                 UProductMetaData(),

                 /// Attributes
                 UProductAttributes(),
                 SizedBox(height: USizes.spaceBtwSections),

                 /// checkout button
                 UElevatedButton(onPressed: () {}, child: Text('Checkout')),
                 SizedBox(height: USizes.spaceBtwSections),

                 /// Description
                 USectionHeading(title: 'Description', showActionButton: false),
                 SizedBox(height: USizes.spaceBtwItems),
                 ReadMoreText(
                   trimLines: 2,
                   trimMode: TrimMode.Line,
                   trimCollapsedText: 'show more',
                   trimExpandedText: ' Less',
                   moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                   lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                   'This is a product description of BATA brand shoes. There are more things that can be added.This is a product description of BATA brand shoes. There are more things that can be added',
                 ),
                 SizedBox(height: USizes.spaceBtwSections),
               ],
             ),
           )

          ],
        ),
      ),
      /// [Bottom Navigation]
      bottomNavigationBar: UBottomAddToCart() ,
    );
  }
}
