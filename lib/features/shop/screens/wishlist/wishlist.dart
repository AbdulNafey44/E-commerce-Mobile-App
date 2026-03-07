import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/controller/product/favourite_controller.dart';

import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/cloud_helper_functions.dart';
import 'package:e_commerce/utils/popups/widgets/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/images.dart';
import '../../models/product_model.dart';


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
            child: Obx(
                () => FutureBuilder(
                  future: FavouriteController.instance.getFavouriteProducts(),
                  builder: (context, snapshot) {
                    final nothingFound = UAnimationLoader
                      (text: 'Wishlist is empty...',
                       animation: UImages.pencilAnimation,
                       showActionButton: true,
                       actionText: "let`s add some",
                       onActionPressed: () => NavigationController.instance.selectedIndex.value= 0,
                    );
                    const loader = UVerticalProductShimmer(itemCount: 6);
                    final widget = UCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader , nothingFound: nothingFound);
                    if(widget != null) return widget ;
                    List<ProductModel> products = snapshot.data!;
                    return UGridLayout(itemCount: products.length,
                        itemBuilder: (context, index) => UProductCard(product: products[index]));
                  }, ),
            )),
        )
        );
    }
}
