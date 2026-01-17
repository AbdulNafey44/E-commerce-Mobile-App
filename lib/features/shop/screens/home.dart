import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/widgets/customeshape/circular_container.dart';
import 'package:e_commerce/features/shop/controller/home/home_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/style/shadow.dart';
import '../../../common/widgets/images/rounded_image.dart';
import '../../../common/widgets/layouts/grid_layout.dart';
import '../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../common/widgets/textfields/search_bar.dart';
import '../../../utils/helpers/device_helpers.dart';
import 'home/widgets/banners_dot_navigation.dart';
import 'home/widgets/home_appbar.dart';
import 'home/widgets/home_categories.dart';
import 'home/widgets/primary_header_container.dart';
import 'home/widgets/promo_slider.dart';

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
        
                  UGridLayout()
        
                ],
        
              ),
            ),
          ],
        ),
      ),
    );
  }
}






