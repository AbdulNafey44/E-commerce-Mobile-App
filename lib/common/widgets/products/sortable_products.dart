import 'package:e_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:e_commerce/features/shop/controller/product/all_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/sizes.dart';
import '../layouts/grid_layout.dart';


class UScrolableProducts extends StatelessWidget {
  const UScrolableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = AllProductsController.instance;
    controller.assignProducts(products);
    return Column(
      children: [
        /// filter field
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) =>  controller.sortProducts(value!),
          items: ['Name', 'Lower Price', 'Higher Price', 'Sale', 'NewSet'].map((filter){
            return DropdownMenuItem(value: filter, child: Text(filter));
          },).toList(),
        ),
        SizedBox(height: USizes.spaceBtwSections),
        /// vertical product cards
        Obx( () => UGridLayout(itemCount: controller.products.length, itemBuilder: (context, index) => UProductCard(product: controller.products[index]))),
      ],
    );
  }
}