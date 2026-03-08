import 'package:e_commerce/common/style/padding.dart';

import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/shop/controller/category/category_controller.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/sub_categories/widgets/product_card_horizontal.dart';

import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/cloud_helper_functions.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../../../common/widgets/appbar/appbar.dart';



class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModel category ;
  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    final controller = Get.put(CategoryController());
    return Scaffold(
      appBar: UAppBar( showBackArrow: true, title: Text(category.name, style: Theme.of(context).textTheme.headlineMedium)),
      body: SingleChildScrollView(
        child: Padding(padding: UPading.screenPading,
          child: Column(
            children: [

              /// fetch subcategory
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    /// handle loading , error state
                    final widget = UCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                    if(widget != null) return widget;
                    List<CategoryModel> subCategories = snapshot.data!;
                    /// fetch product for sub category
                return ListView.builder(
                    shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        CategoryModel subCategory = subCategories[index];
                          return FutureBuilder(
                              future: controller.getCategoryProducts(categoryId: subCategory.id),
                              builder: (context, snapshot) {
                                /// handle error , empty state
                                final widget = UCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                                if(widget != null) return widget;
                                List<ProductModel> products = snapshot.data!;
                                  return Column(
                                  children: [
                                    /// sub category
                                    USectionHeading(title: subCategory.name, onPressed: (){},),
                                    SizedBox(height: USizes.spaceBtwItems/2),

                                    /// Horizontal Product Card
                                    SizedBox(height: 120, child: ListView.separated(
                                      separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems/2),
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        ProductModel product = products[index];
                                        return UProductCardHorizontal(product: product);
                                      },)),
                                  ],
                                );
                              },);
                      }, );
                  }, ),

            ],
          ),
        
        ),
      ),
    );
  }
}


