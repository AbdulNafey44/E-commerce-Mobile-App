import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce/features/shop/controller/cart/cart_controller.dart';

import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce/utils/constants/images.dart';

import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      ///...[App Bar]...///
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
        actions: [UCircularIcon(icon: Iconsax.box_remove, onPressed: controller.clearCart)],
      ),

      ///...[Body]...///
      body: Obx(
        () {
          final emptyWidget = UAnimationLoader(
              text: 'Cart is empty',
              animation: UImages.cartEmptyAnimation,
            showActionButton: true,
            actionText: "lets fill it",
            onActionPressed:  Get.back,
          );
          if(controller.cartItems.isEmpty){
            return emptyWidget;
          }
          return SingleChildScrollView(
            child: Padding(
              padding: UPading.screenPading,
              child: UCartItems(),
            ),
          );
        }
      ),
      ///....[Bottom]...//
      bottomNavigationBar: Obx(
          () {
            if(controller.cartItems.isEmpty) return SizedBox();
            return Padding(
              padding:EdgeInsets.all(USizes.defaultSpace),
              child: UElevatedButton(onPressed: ()=>  Get.to(CheckOutScreen()), child: Text('Checkout \$${controller.totalCartPrice.value.toStringAsFixed(2)}')),
            );
          }
      ),
    );
  }
}


