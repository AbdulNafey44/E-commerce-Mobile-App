import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';

import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/sortable_products.dart';
import '../../models/brand_model.dart';


class BrandsProductsScreen extends StatelessWidget {
  const BrandsProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(showBackArrow: true,
        title: Text('Bata', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: UPading.screenPading,
          child: Column(
            children: [
              /// brand
             UBrandCard(brand: BrandModel.empty()),
              SizedBox(height: USizes.spaceBtwSections),
             /// brands products
             UScrolableProducts(products: []),
            ],
          ),
        ),
      ),
    );
  }
}
