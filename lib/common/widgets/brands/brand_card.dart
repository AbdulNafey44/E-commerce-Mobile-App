import 'package:flutter/material.dart';

import '../../../utils/constants/enum.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';
import '../customeshape/rounded_container.dart';
import '../images/rounded_image.dart';
import '../text/brand_title_with_verify_icon.dart';


class UBrandCard extends StatelessWidget {
  const UBrandCard({
    super.key,
    this.showBorder = true,
     this.onTap,
  });
  final bool showBorder ;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: URoundedContainer(
        height: USizes.brandCardHeight,
        showBorder: showBorder,
        padding: EdgeInsets.all(USizes.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            ///brand image
            Flexible(child: URoundedImage(imageUrl: UImages.bataLogo)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///brand title & verify icon
                  UBrandTitleWithverifyIcon(title: 'Bata' , brandTextSize: TextSizes.large),
                  /// Text
                  Text('172 products', style: Theme.of(context).textTheme.labelMedium,overflow: TextOverflow.ellipsis,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


