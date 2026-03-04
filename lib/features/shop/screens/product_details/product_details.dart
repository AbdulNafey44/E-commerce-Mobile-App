import 'package:e_commerce/common/style/padding.dart';

import 'package:e_commerce/common/widgets/button/elevated_button.dart';

import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_thumbnail_and_slider.dart';
import 'package:e_commerce/utils/constants/enum.dart';

import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';


class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product ;
  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return Scaffold(
      ///...[Body]...///
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///...[product image with slider]...///
            UProductThumbnailAndSlider(product: product),
           Padding(
             padding: UPading.screenPading,
             child: Column(
               children: [
                 /// product details ///
                 /// price, titl, stock and brand
                 UProductMetaData(product: product),

                 /// Attributes
                 if(product.productType == ProductType.variable.toString())...[
                   UProductAttributes(product: product),
                   SizedBox(height: USizes.spaceBtwSections),
                 ],


                 /// checkout button
                 UElevatedButton(onPressed: () {}, child: Text('Checkout')),
                 SizedBox(height: USizes.spaceBtwSections),

                 /// Description
                 USectionHeading(title: 'Description', showActionButton: false),
                 SizedBox(height: USizes.spaceBtwItems),
                 ReadMoreText(
                   product.description ?? '',
                   trimLines: 2,
                   trimMode: TrimMode.Line,
                   trimCollapsedText: 'show more',
                   trimExpandedText: ' Less',
                   moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                   lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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
