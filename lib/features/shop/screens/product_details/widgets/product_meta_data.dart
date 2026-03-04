import 'package:e_commerce/features/shop/controller/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/enum.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';


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
    super.key, required this.product,
  });

  final ProductModel product ;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    String? salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// sale tag , sale price , actual price and share button
          Row(
            children: [
              /// Sale Tag
              if(salePercentage != null)...[
                URoundedContainer(
                  radius: USizes.sm,
                  backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                  padding: const EdgeInsets.symmetric(horizontal: USizes.sm, vertical: USizes.xs),
                  child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black)),
                ),
                SizedBox(width: USizes.spaceBtwItems,),
              ],

              /// Actual Price
              if(product.productType == ProductType.single.toString() && product.salePrice > 0)...[
                Text('${UText.currency}${product.price.toStringAsFixed(0)}',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                SizedBox(width: USizes.spaceBtwItems),
              ],

              /// sale price
              UProductPriceText(price: controller.getProductPrice(product), isLarge: true,),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.share)),
            ],
          ),
          SizedBox(height: USizes.spaceBtwItems / 1.5,),
          /// product title
          UProductTitleText(title: product.title),
          SizedBox(height: USizes.spaceBtwItems / 1.5,),
          /// product status
          Row(
            children: [
              UProductTitleText(title: 'Status'),
              SizedBox(width: USizes.spaceBtwItems),
              Text(controller.getProductStatus(product.stock),style: Theme.of(context).textTheme.titleMedium,)
            ],
          ),
          SizedBox(height: USizes.spaceBtwItems,),

          Row(
            children: [
              ///  product brand image with title
              UCircularImage(
                padding: 0,
                isNetworkImage: true,
                image: product.brand != null ? product.brand!.image : '',width: 34.0,height: 34.0,),
              SizedBox(width: USizes.spaceBtwItems,),
              UBrandTitleWithverifyIcon(title: product.brand != null ? product.brand!.name : ''),
            ],
          )

        ],
    );
  }
}