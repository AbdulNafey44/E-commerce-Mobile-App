import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_thumbnail_and_slider.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
            UProductThumbnailAndSlider(dark: dark),

            /// product details ///
            /// price, titl, stock and brand
            /// Attributes
            /// checkout button
            /// Description
          ],
        ),
      ),

      /// Bottom Navigation
    );
  }
}

