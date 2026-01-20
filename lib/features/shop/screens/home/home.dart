import 'package:e_commerce/features/shop/controller/home/home_controller.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../common/widgets/textfields/search_bar.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import '../../../../common/widgets/customeshape/primary_header_container.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///..upper part...//
            Stack(
              children: [
                //...total height + 20 ...///
                Container(height: USizes.homePrimaryHeaderHeight + 10),
        
                ///...Primary Header Container..///
                UPrimaryHeaderContainer(
                  height: USizes.homePrimaryHeaderHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UHomeAppBar(),
                      SizedBox(height: USizes.spaceBtwSections),
        
                      ///...Home Categories...///
                      UHomeCategories(),
                    ],
                  ),
                ),
        
                ///...Search Bar...//
                USearchBar(),
              ],
            ),
            ///....lower part...//
        
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
        
                  ///..banners...//
                  UPromeSlider(banners: [UImages.homeBanner1, UImages.homeBanner2, UImages.homeBanner3, UImages.homeBanner4, UImages.homeBanner5],),
        
                  const SizedBox(height: USizes.spaceBtwItems),
                  USectionHeading(title: 'Popular Products', onPressed: (){},),
                  const SizedBox(height: USizes.spaceBtwItems),
                  /// vertical product card
                 /// GridView of Product Card
                  UGridLayout(
                    itemCount: 6,
                      itemBuilder: (context, index) {
                        return UProductCard();
                      },
                  ),
        
                ],
        
              ),
            ),
          ],
        ),
      ),
    );
  }
}






