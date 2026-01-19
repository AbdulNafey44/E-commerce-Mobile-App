import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';


class UCategoryTab extends StatelessWidget {
  const UCategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
          child: Column(
            children: [
              UBrandShowCase(images: [UImages.productImage47, UImages.productImage43, UImages.productImage7]),
              UBrandShowCase(images: [UImages.productImage47, UImages.productImage43, UImages.productImage7]),
              SizedBox(height: USizes.spaceBtwItems),
              USectionHeading(title: 'You might like', onPressed: (){},),
              UGridLayout(itemCount: 10, itemBuilder: (context, index) {
                return UProductCard();
              },)
            ],
          ),
        )
      ],
    );
  }
}