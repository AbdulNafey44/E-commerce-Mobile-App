import 'package:e_commerce/common/style/padding.dart';

import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/shop/screens/sub_categories/widgets/product_card_horizontal.dart';

import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';


import '../../../../common/widgets/appbar/appbar.dart';



class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: UAppBar( showBackArrow: true, title: Text('Sports', style: Theme.of(context).textTheme.headlineMedium)),
      body: SingleChildScrollView(
        child: Padding(padding: UPading.screenPading,
          child: Column(
            children: [
              /// sub category
              USectionHeading(title: 'Sports Shoes', onPressed: (){},),
              SizedBox(height: USizes.spaceBtwItems/2),

              /// Horizontal Product Card
              SizedBox(height: 120, child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems/2),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                return UProductCardHorizontal();
              },)),
              /// sub category
              USectionHeading(title: 'Sports Shoes', onPressed: (){},),
              SizedBox(height: USizes.spaceBtwItems/2),

              /// Horizontal Product Card
              SizedBox(height: 120, child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems/2),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return UProductCardHorizontal();
                },)),
            ],
          ),
        
        ),
      ),
    );
  }
}


