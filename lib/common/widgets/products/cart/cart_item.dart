import 'package:e_commerce/features/shop/models/cart_item_model.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/rounded_image.dart';
import '../../text/brand_title_with_verify_icon.dart';
import '../../text/product_title_text.dart';

class UCartItom extends StatelessWidget {
  const UCartItom({
    super.key, required this.cartItem,

  });

  final CartItemModel cartItem ;

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);

    return Row(
      children: [
        /// Product Image
        URoundedImage(
          imageUrl: cartItem.image ?? '',
          isNetworkImage: true,
          height: 60,
          width: 60,
          padding: EdgeInsets.all(USizes.sm),
          backGroundColor: dark ? UColors.darkerGrey : UColors.light,
        ),
        /// Brand , Name , Variation
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Brand
            UBrandTitleWithverifyIcon(title: cartItem.brandName ?? ''),
            /// Title
            UProductTitleText(title: cartItem.title),
            /// Variations
            RichText(
              text: TextSpan(children: (cartItem.selectedVariation ?? {}).entries.map((e) => TextSpan(
                       children: [
                         TextSpan(text: e.key,style: Theme.of(context).textTheme.bodySmall),
                         TextSpan(text: '${e.value}',style: Theme.of(context).textTheme.bodyLarge),
                       ]
              )).toList())),

              ],
        ),)
      ],
    );
  }
}