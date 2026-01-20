import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/features/shop/controller/home/home_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';
import 'banners_dot_navigation.dart';

class UPromeSlider extends StatelessWidget {
  const UPromeSlider({
    super.key, required this.banners,
  });
  final List<String> banners ;
  @override
  Widget build(BuildContext context) {

    final controller =  HomeController.instance;
    return Column(
      children: [
        ///...Slider...///
        CarouselSlider(
            items: banners.map((banner) => URoundedImage(imageUrl: banner)).toList(),
            options: CarouselOptions(viewportFraction: 1.0,

              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInOut,
              onPageChanged:(index, reason) => controller.onPageChanged(index) ),
          
              

             carouselController: controller.carouselController,),
        ///...///
        SizedBox(height: USizes.spaceBtwItems),
        BannersDotNavigation(),

      ],
    );
  }
}