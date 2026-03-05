import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/controller/product/all_products_controller.dart';
import 'package:e_commerce/utils/helpers/cloud_helper_functions.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../../../common/widgets/products/sortable_products.dart';
import '../../models/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key, this.query, this.futureMethod, required this.title});

  final String title;
  final Future<List<ProductModel>>? futureMethod ;
  final Query? query;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: UPading.screenPading,
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, Snapshot) {
              const loader = UVerticalProductShimmer();
            final widget =  UCloudHelperFunctions.checkMultiRecordState(snapshot: Snapshot, loader: loader);
            if(widget != null)return widget ;
               List<ProductModel> products = Snapshot.data!;
              return UScrolableProducts(products: products);
            }
          ),

        ),

      ),
    );
  }
}


