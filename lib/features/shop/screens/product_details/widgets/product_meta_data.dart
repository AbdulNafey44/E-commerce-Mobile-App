import 'package:flutter/material.dart';

import '../../../../../common/style/padding.dart';
import '../../../../../common/widgets/customeshape/rounded_container.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/text/brand_title_with_verify_icon.dart';
import '../../../../../common/widgets/text/product_price_text.dart';
import '../../../../../common/widgets/text/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';


class UProductMetaData extends StatelessWidget {
  const UProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UPading.screenPading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// sale tag , sale price , actual price and share button
          Row(
            children: [
              /// Sale Tag
              URoundedContainer(
                radius: USizes.sm,
                backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                padding: const EdgeInsets.symmetric(horizontal: USizes.sm, vertical: USizes.xs),
                child: Text('20%', style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black)),
              ),
              SizedBox(width: USizes.spaceBtwItems,),
              /// sale price
              Text('\$250',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
              SizedBox(width: USizes.spaceBtwItems,),
              /// actual price
              UProductPriceText(price: '120', isLarge: true,),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.share)),
            ],
          ),
          SizedBox(height: USizes.spaceBtwItems / 1.5,),
          /// product title
          UProductTitleText(title: 'Face Wash'),
          SizedBox(height: USizes.spaceBtwItems / 1.5,),
          /// product status
          Row(
            children: [
              UProductTitleText(title: 'Status'),
              SizedBox(width: USizes.spaceBtwItems),
              Text('In Stock',style: Theme.of(context).textTheme.titleMedium,)
            ],
          ),
          SizedBox(height: USizes.spaceBtwItems,),

          Row(
            children: [
              UCircularImage(
                padding: 0,
                image: UImages.dariMoochLogo,width: 34.0,height: 34.0,),
              SizedBox(width: USizes.spaceBtwItems,),
              UBrandTitleWithverifyIcon(title: 'Darhi Mooch'),
            ],
          )

        ],
      ),
    );
  }
}