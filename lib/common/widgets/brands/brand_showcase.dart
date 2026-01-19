import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';
import '../customeshape/rounded_container.dart';
import 'brand_card.dart';


class UBrandShowCase extends StatelessWidget {
  const UBrandShowCase({
    super.key, required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    return URoundedContainer(
      showBorder: true,
      borderColor: UColors.darkerGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(USizes.md),
      margin: EdgeInsets.only(bottom: USizes.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UBrandCard(showBorder: false),
         Row(
             children:  images.map((image) => BuildBrandImage(dark, image)).toList()
         )
      ],
      ),
    );
  }

  Widget BuildBrandImage(bool dark, String image) {
    return Expanded(
      child: URoundedContainer(
            height: 100,
            margin: const EdgeInsets.only(right: USizes.sm),
            padding: const EdgeInsets.all(USizes.md),
            backgroundColor: dark ? UColors.darkerGrey : UColors.light,
            child: Image(image: AssetImage(image)),
          ),
    );
  }
}