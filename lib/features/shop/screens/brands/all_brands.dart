import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'brand_products.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(showBackArrow: true,
         title: Text('Brands', style: Theme.of(context).textTheme.headlineMedium)),
         body: SingleChildScrollView(
           child: Padding(
             padding: UPading.screenPading,
             child: Column(
               children: [
                 /// brand text
                 USectionHeading(title: 'Brands', showActionButton: false),
                 SizedBox(height: USizes.spaceBtwItems),
                 /// List of Brands
                 UGridLayout(itemCount: 10, itemBuilder: (context, index) => UBrandCard(onTap: () => Get.to(BrandsProductsScreen())), mainAxisExtent: 80),

               ],

             ),
           ),
         ),
    );
  }
}
