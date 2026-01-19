import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';
import '../customeshape/rounded_container.dart';
import 'brand_card.dart';


class UBrandShowCase extends StatelessWidget {
  const UBrandShowCase({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      showBorder: true,
      borderColor: UColors.darkerGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(USizes.md),
      margin: EdgeInsets.only(bottom: USizes.spaceBtwItems),
      child: Column(
        children: [
          UBrandCard(showBorder: false),
          URoundedContainer(
            height: 100,
            margin: const EdgeInsets.only(right: USizes.sm),
            padding: const EdgeInsets.all(USizes.md),
            backgroundColor: dark ? UColors.darkerGrey : UColors.white,
            child: Image(image: AssetImage(UImages.productImage47)),
          )
        ],
      ),
    );
  }
}