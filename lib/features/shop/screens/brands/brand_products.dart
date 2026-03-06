import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/controller/brand/brand_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';

import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/sortable_products.dart';
import '../../models/brand_model.dart';


class BrandsProductsScreen extends StatelessWidget {
  const BrandsProductsScreen({super.key, required this.title, required this.brand});

  final String title;
  final BrandModel brand ;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: UAppBar(showBackArrow: true,
        title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: UPading.screenPading,
          child: Column(
            children: [
              /// brand
             UBrandCard(brand: brand),
              SizedBox(height: USizes.spaceBtwSections),
             /// brands products
             FutureBuilder(
               future: controller.getBrandProducts(brand.id),
               builder: (context, snapshot) {
                 /// handle loading , error , empty state
                 /// loader
                 const loader = UVerticalProductShimmer();
                Widget ? widget =   UCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                if(widget != null) return widget ;
                /// Data found
                 List<ProductModel> products = snapshot.data!;
                 return UScrolableProducts(products: products);
               }
             ),
            ],
          ),
        ),
      ),
    );
  }
}
