import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controller/product/product_controller.dart';
import '../../../models/brand_model.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({
    super.key,
    required this.brand,
  });

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instance;

    // fetch all products on first build
    productController.getAllProducts();

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
          child: Column(
            children: [
              /// Brand showcase 1
              UBrandShowCase(
                images: [
                  UImages.productImage47,
                  UImages.productImage43,
                  UImages.productImage7
                ],
                brand: brand,
              ),

              /// Brand showcase 2
              UBrandShowCase(
                images: [
                  UImages.productImage47,
                  UImages.productImage43,
                  UImages.productImage7
                ],
                brand: brand,
              ),

              const SizedBox(height: USizes.spaceBtwItems),

              /// "You might like" heading
              USectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),

              /// Grid layout products
              Obx(() {
                if (productController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (productController.allProducts.isEmpty) {
                  return const Center(
                    child: Text('No Products Found'),
                  );
                }

                return UGridLayout(
                  itemCount: productController.allProducts.length,
                  itemBuilder: (context, index) {
                    final product = productController.allProducts[index];

                    // ✅ URoundedImage inside UProductCard will handle CachedNetworkImage automatically
                    return UProductCard(product: product);
                  },
                );
              }),

              const SizedBox(height: USizes.spaceBtwSections),
            ],
          ),
        )
      ],
    );
  }
}