import 'package:e_commerce/common/widgets/customeshape/rounded_container.dart';
import 'package:e_commerce/common/widgets/text/product_price_text.dart';
import 'package:e_commerce/common/widgets/text/product_title_text.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/shop/controller/product/variation_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/chip/choice_chip.dart';
import '../../../../../utils/constants/colors.dart';

class UProductAttributes extends StatelessWidget {
  const UProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
        () => Column(
        children: [
          /// Selected attributes pricing and description
          if(controller.selectedVariation.value.id.isNotEmpty)
          URoundedContainer(
            padding: EdgeInsets.all(USizes.md),
            backgroundColor: dark ? UColors.darkGrey : UColors.light,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// title , price, stock
                Row(
                  children: [
                    /// variation heading
                    const USectionHeading(
                      title: 'Variation',
                      showActionButton: false,
                    ),
                    SizedBox(width: USizes.spaceBtwItems),

                    /// price & stock
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const UProductTitleText(
                              title: 'Price : ',
                              smallSize: true,
                            ),
                            if(controller.selectedVariation.value.salePrice > 0)
                            Text(
                              '${UText.currency}${controller.selectedVariation.value.price.toStringAsFixed(0)}',
                              style: Theme.of(context).textTheme.titleSmall!
                                  .apply(decoration: TextDecoration.lineThrough),
                            ),
                            SizedBox(width: USizes.spaceBtwItems),
                             UProductPriceText(price: controller.getVariationPrice()),
                          ],
                        ),
                        Row(
                          children: [
                            const UProductTitleText(
                              title: 'Stock : ',
                              smallSize: true,
                            ),
                            Text(
                              controller.variationStockStatus.value,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: USizes.spaceBtwItems),

                /// description
                 UProductTitleText(
                  title: controller.selectedVariation.value.description ?? '' ,
                  smallSize: true,
                  maxLines: 4,
                ),
              ],
            ),
          ),

          SizedBox(height: USizes.spaceBtwItems),

          /// Colors section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  USectionHeading(title: attribute.name ?? '', showActionButton: false),
                  SizedBox(height: USizes.spaceBtwItems / 2),
                  Wrap(
                    spacing: USizes.sm,
                    children: attribute.values!.map((attributeValue){
                      bool isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                      bool available = controller.getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!).contains(attributeValue);
                      return UChoiceChip(
                        text: attributeValue,
                        selected: isSelected,
                        onSelected: available ?  (selected) {
                         if(available && selected){
                           controller.onAttributeSelected(product, attribute.name, attributeValue);
                         }
                        } : null ,

                      );
                    }).toList(),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
