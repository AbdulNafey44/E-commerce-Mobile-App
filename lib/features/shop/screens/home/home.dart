import 'package:e_commerce/features/shop/controller/home/home_controller.dart';
import 'package:e_commerce/features/shop/controller/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../common/widgets/textfields/search_bar.dart';
import '../all_products/all_products.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import '../../../../common/widgets/customeshape/primary_header_container.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///..upper part...//
            Stack(
              children: [
                //...total height + 20 ...///
                Container(height: USizes.homePrimaryHeaderHeight + 10),

                ///...Primary Header Container..///
                UPrimaryHeaderContainer(
                  height: USizes.homePrimaryHeaderHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UHomeAppBar(),
                      SizedBox(height: USizes.spaceBtwSections),

                      ///...Home Categories...///
                      UHomeCategories(),
                    ],
                  ),
                ),

                ///...Search Bar...//
                USearchBar(),
              ],
            ),

            ///....lower part...//
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  ///..banners...//
                  UPromeSlider(),

                  const SizedBox(height: USizes.spaceBtwItems),
                  USectionHeading(
                    title: 'Popular Products',
                    onPressed: () =>
                        Get.to(AllProductsScreen(title: 'Popular Products', futureMethod: controller.getAllFeaturedProduct() ,)),
                  ),
                  const SizedBox(height: USizes.spaceBtwItems),

                  /// vertical product card
                  /// GridView of Product Card
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(child: Text('Products not found'));
                    }
                    return UGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (context, index) {
                        ProductModel product =
                            controller.featuredProducts[index];
                        return UProductCard(product: product);
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
