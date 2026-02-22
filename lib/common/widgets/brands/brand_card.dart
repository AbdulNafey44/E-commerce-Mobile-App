import 'package:e_commerce/features/shop/models/brand_model.dart';
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
     this.onTap, required this.brand,
  });
  final bool showBorder ;
  final VoidCallback? onTap;

  final BrandModel brand ;
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
            Flexible(child: URoundedImage(imageUrl: brand.image,
            isNetworkImage: true,)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///brand title & verify icon
                  UBrandTitleWithverifyIcon(title: brand.name , brandTextSize: TextSizes.large),
                  /// Text
                  Text('${brand.productsCount}products', style: Theme.of(context).textTheme.labelMedium,overflow: TextOverflow.ellipsis,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


