import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';


class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: UAppBar(
          title: Text('Wishlist', style: Theme
              .of(context)
              .textTheme
              .headlineMedium),
          actions: [
            UCircularIcon(icon: Iconsax.add,
                onPressed: () =>
                NavigationController.instance.selectedIndex.value = 0
            ),

          ],
        ),
        body: SingleChildScrollView(child: Padding(
            padding: const EdgeInsets.all(USizes.defaultSpace),
            child: UGridLayout(itemCount: 10,
                itemBuilder: (context, index) => UProductCard())),
        )
        );
    }
}
