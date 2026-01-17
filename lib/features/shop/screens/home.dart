import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/widgets/customeshape/circular_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import '../../../common/widgets/images/rounded_image.dart';
import '../../../common/widgets/textfields/search_bar.dart';
import '../../../utils/helpers/device_helpers.dart';
import 'home/widgets/banners_dot_navigation.dart';
import 'home/widgets/home_appbar.dart';
import 'home/widgets/home_categories.dart';
import 'home/widgets/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          ///..banners...//
          Padding(
            padding: const EdgeInsets.all(USizes.defaultSpace),
            child: Column(
              children: [
                ///...Slider...///
                CarouselSlider(
                  items: [
                    URoundedImage(imageUrl: UImages.homeBanner1),
                    URoundedImage(imageUrl: UImages.homeBanner2),
                    URoundedImage(imageUrl: UImages.homeBanner3),
                    URoundedImage(imageUrl: UImages.homeBanner4),
                    URoundedImage(imageUrl: UImages.homeBanner5),
                  ],
                  options: CarouselOptions(viewportFraction: 1.0)),
                ///...///
                SizedBox(height: USizes.spaceBtwItems),
                BannersDotNavigation(),

              ],
            ),
          ),
        ],
      ),
    );
  }
}





