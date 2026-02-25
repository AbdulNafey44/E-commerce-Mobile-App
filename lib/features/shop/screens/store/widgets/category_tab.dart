import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/brand_model.dart';
import '../../../models/product_model.dart';


class UCategoryTab extends StatelessWidget {
  const UCategoryTab({
    super.key, required this.brand,
  });

  final BrandModel brand;
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
              ///brand show case 1
              UBrandShowCase(images: [UImages.productImage47, UImages.productImage43, UImages.productImage7], brand: brand,),
              ///brand show case 2
              UBrandShowCase(images: [UImages.productImage47, UImages.productImage43, UImages.productImage7], brand: brand),
              SizedBox(height: USizes.spaceBtwItems),
              /// you might like heading
              USectionHeading(title: 'You might like', onPressed: (){},),
              /// grid layout products
              UGridLayout(itemCount: 6, itemBuilder: (context, index) {
                return UProductCard(product: ProductModel.empty());
              },),
              SizedBox(height: USizes.spaceBtwSections,),
            ],
          ),
        )
      ],
    );
  }
}