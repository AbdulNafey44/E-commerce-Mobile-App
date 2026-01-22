import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/rounded_image.dart';
import '../../text/brand_title_with_verify_icon.dart';
import '../../text/product_title_text.dart';

class UCartItom extends StatelessWidget {
  const UCartItom({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Product Image
        URoundedImage(
          imageUrl: UImages.productImage4a,
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
            UBrandTitleWithverifyIcon(title: 'Iphone'),
            /// Title
            UProductTitleText(title: 'Iphone 14 64 GB'),
            /// Variations
            RichText(text: TextSpan(children:[
              TextSpan(text: 'Color ',style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: 'Green ',style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(text: 'Storage ',style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: '512GB ',style: Theme.of(context).textTheme.bodyLarge),
            ],
            )),

          ],
        ),)
      ],
    );
  }
}