import 'package:e_commerce/common/widgets/customeshape/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../style/shadow.dart';

class UProductCard extends StatelessWidget {
  const UProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    return Container(
      width: 100,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: UShadow.verticalProductShadow,
        borderRadius: BorderRadius.circular(USizes.productImageRadius),
        color: dark ? UColors.darkerGrey : UColors.white,
      ),
      child: Column(
        children: [
          URoundedContainer(
            width: 180,
            padding:  const EdgeInsets.all(USizes.sm),
            backgroundColor: dark ? UColors.dark : UColors.light,

            child: Stack(
              children: [
                Image(image: AssetImage(assetName))
              ],
            ),
          )
        ],
      ),
    );
  }
}