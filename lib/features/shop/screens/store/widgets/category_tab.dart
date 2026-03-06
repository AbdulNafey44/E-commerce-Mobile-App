import 'package:e_commerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/controller/category/category_controller.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/brand_model.dart';
import '../../../models/product_model.dart';
import 'category_brands.dart';


class UCategoryTab extends StatelessWidget {
  const UCategoryTab({
    super.key, required this.category,
  });
  final CategoryModel category ;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
          child: Column(
            children: [
              CategoryBrands(category: category),
              SizedBox(height: USizes.spaceBtwItems),
              /// you might like heading
              USectionHeading(title: 'You might like', onPressed: () => Get.to(() => AllProductsScreen(title: category.name,
               futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
              )),),
              /// grid layout products
             FutureBuilder(

                 future: controller.getCategoryProducts(categoryId: category.id),
                 builder: (context, snapshot) {
                   const loader = UVerticalProductShimmer(itemCount: 4);
                   final widget = UCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                   if(widget != null) return widget ;

                  List<ProductModel> products = snapshot.data!;
                   return  UGridLayout(itemCount: products.length, itemBuilder: (context, index) {
                     ProductModel product = products[index];
                     return UProductCard(product: product);
                   },);
                 }, ),
              SizedBox(height: USizes.spaceBtwSections,),
            ],
          ),
        )
      ],
    );
  }
}


