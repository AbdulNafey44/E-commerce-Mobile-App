import 'package:e_commerce/common/widgets/customeshape/rounded_container.dart';
import 'package:e_commerce/common/widgets/text/product_price_text.dart';
import 'package:e_commerce/common/widgets/text/product_title_text.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chip/choice_chip.dart';
import '../../../../../utils/constants/colors.dart';

class UProductAttributes extends StatelessWidget {
  const UProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);

    return Column(
      children: [
        /// Selected attributes pricing and description
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
                          Text(
                            '250',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(
                              decoration:
                              TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: USizes.spaceBtwItems),
                          const UProductPriceText(price: '200'),
                        ],
                      ),
                      Row(
                        children: [
                          const UProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: USizes.spaceBtwItems),

              /// description
              const UProductTitleText(
                title: 'Most popular product of darhi mooch',
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
          children: [
            const USectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            SizedBox(height: USizes.spaceBtwItems / 2),
            Wrap(
              spacing: USizes.sm,
              children: [
                UChoiceChip(
                    text: 'Red',
                    selected: true,
                    onSelected: (value) {}),
                UChoiceChip(
                    text: 'Blue',
                    selected: false,
                    onSelected: (value) {}),
                UChoiceChip(
                    text: 'Yellow',
                    selected: false,
                    onSelected: (value) {}),
              ],
            ),
          ],
        ),
        /// Size Section
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const USectionHeading(
              title: 'Sizes',
              showActionButton: false,
            ),
            SizedBox(height: USizes.spaceBtwItems / 2),
            Wrap(
              spacing: USizes.sm,
              children: [
                UChoiceChip(
                    text: 'Small',
                    selected: true,
                    onSelected: (value) {}),
                UChoiceChip(
                    text: 'Medium',
                    selected: false,
                    onSelected: (value) {}),
                UChoiceChip(
                    text: 'Large',
                    selected: false,
                    onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
