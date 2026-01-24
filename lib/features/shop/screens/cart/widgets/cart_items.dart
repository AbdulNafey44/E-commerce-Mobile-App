import 'package:e_commerce/features/shop/screens/cart/widgets/product_quantity_with_add_remove.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/text/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class UCartItems extends StatelessWidget {
  const UCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });
final bool showAddRemoveButtons ;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) =>
          SizedBox(height: USizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          children: [
            /// cart itom
            UCartItom(),
            if(showAddRemoveButtons) SizedBox(height: USizes.spaceBtwItems),
            if(showAddRemoveButtons) Row(
              children: [
                /// extra space
                SizedBox(width: 70),
                /// Quantity Buttons
                UProductQuantityWithAddRemove(),
                Spacer(),
                UProductPriceText(price: '120'),
              ],
            ),
          ],
        );

      },
    );
  }
}