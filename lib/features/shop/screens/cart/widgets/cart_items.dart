import 'package:e_commerce/features/shop/controller/cart/cart_controller.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/product_quantity_with_add_remove.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    final controller = CartController.instance;
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) =>
          SizedBox(height: USizes.spaceBtwSections),
      itemCount: controller.cartItems.length,
      itemBuilder: (context, index) {
        return Obx(
            () {
              final cartItem = controller.cartItems[index];
              return  Column(
                children: [
                  /// cart item
                  UCartItom(cartItem: cartItem),
                  if(showAddRemoveButtons) SizedBox(height: USizes.spaceBtwItems),
                  if(showAddRemoveButtons) Row(
                    children: [
                      /// extra space
                      SizedBox(width: 70),
                      /// Quantity Buttons
                      UProductQuantityWithAddRemove(
                        quantity: cartItem.quantity,
                         add: () => controller.addOneToCart(cartItem),
                          remove: () => controller.removeOneFromCart(cartItem)),
                      Spacer(),
                      UProductPriceText(price: (cartItem.price * cartItem.quantity).toStringAsFixed(0)),
                    ],
                  ),
                ],
              );
            }
        );

      },
    );
  }
}