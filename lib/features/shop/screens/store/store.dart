import 'package:e_commerce/common/widgets/shimmer/brands_shimmer.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/shop/controller/brand/brand_controller.dart';
import 'package:e_commerce/features/shop/controller/category/category_controller.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/store_primary_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../utils/constants/sizes.dart';
import '../brands/all_brands.dart';
import '../brands/brand_products.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final brandController = Get.put(BrandController());

    return DefaultTabController(
      length: controller.featureCategories.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: false,
                expandedHeight: 340,
                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    children: [
                      UStorePrimaryHeader(),
                      const SizedBox(height: USizes.spaceBtwItems),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: USizes.defaultSpace,
                        ),
                        child: Column(
                          children: [
                            USectionHeading(
                              title: 'Brands',
                              onPressed: () => Get.to(() => BrandsScreen()),
                            ),
                            const SizedBox(height: USizes.spaceBtwItems),
                            SizedBox(
                              height: USizes.brandCardHeight,
                              child: Obx(() {
                                if (brandController.isLoading.value) {
                                  return const UBrandsShimmer();
                                }

                                if (brandController.featuredBrands.isEmpty) {
                                  return const Text('Brands Not Found');
                                }

                                return ListView.separated(
                                  separatorBuilder: (context, index) =>
                                  const SizedBox(width: USizes.spaceBtwItems),
                                  itemCount: brandController.featuredBrands.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    BrandModel brand =
                                    brandController.featuredBrands[index];

                                    return SizedBox(
                                      width: USizes.brandCardWidth,
                                      child: UBrandCard(
                                        onTap: () => Get.to(
                                              () => BrandsProductsScreen(
                                            title: brand.name,
                                            brand: brand,
                                          ),
                                        ),
                                        brand: brand,
                                      ),
                                    );
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: UTabBar(
                  tabs: controller.featureCategories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ),
            ];
          },

          body: TabBarView(
            children: controller.featureCategories
                .map((category) => UCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}