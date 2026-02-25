import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/enum.dart';
import '../../../utils/constants/sizes.dart';
import '../customeshape/rounded_container.dart';
import '../images/rounded_image.dart';
import '../text/brand_title_with_verify_icon.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({
    super.key,
    this.showBorder = true,
    this.onTap,
    required this.brand,
  });

  final bool showBorder;
  final VoidCallback? onTap;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: URoundedContainer(
        height: USizes.brandCardHeight,
        showBorder: showBorder,
        padding: const EdgeInsets.all(USizes.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [

            /// ✅ FIXED IMAGE SIZE (no Flexible)
            SizedBox(
              width: 50,
              height: 50,
              child: URoundedImage(
                imageUrl: (brand.image != null && brand.image!.isNotEmpty)
                    ? brand.image!
                    : 'https://via.placeholder.com/150',
                isNetworkImage: true,
              ),
            ),

            const SizedBox(width: 8),

            /// ✅ FIXED TEXT AREA
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title with overflow control
                  Flexible(
                    child: UBrandTitleWithverifyIcon(
                      title: brand.name ?? 'Brand',
                      brandTextSize: TextSizes.large,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    '${brand.productsCount ?? 0} products',
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}