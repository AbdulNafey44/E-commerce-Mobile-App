import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';

import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items.dart';

import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///...[App Bar]...///
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
      ),

      ///...[Body]...///
      body: Padding(
        padding: UPading.screenPading,
        child: UCartItems(),
      ),
      ///....[Bottom]...//
      bottomNavigationBar: Padding(
        padding:EdgeInsets.all(USizes.defaultSpace),
        child: UElevatedButton(onPressed: ()=>  Get.to(CheckOutScreen()), child: Text('Checkout \$1200')),
      ),
    );
  }
}



