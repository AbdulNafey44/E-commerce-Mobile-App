import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/features/shop/controller/banner/banner_controller.dart';
import 'package:e_commerce/features/shop/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';
import 'banners_dot_navigation.dart';

class UPromeSlider extends StatelessWidget {
  const UPromeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {


    final bannerController = Get.put(BannerController());
    return Obx(
        () {
          if(bannerController.isLoading.value){
            return UShimmerEffect(width: double.infinity, height: 190);
          }
          if(bannerController.banners.isEmpty){
            return Text('Banners not found');
          }
          return Column(
            children: [
              ///...Slider...///
              CarouselSlider(
                items: bannerController.banners.map((banner) => URoundedImage(imageUrl: banner.imageUrl, isNetworkImage: true, ontap: () => Get.toNamed(banner.targetScreen),)).toList(),
                options: CarouselOptions(viewportFraction: 1.0,

                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.easeInOut,
                    onPageChanged:(index, reason) => bannerController.onPageChanged(index) ),



                carouselController: bannerController.carouselController,),
              ///...///
              SizedBox(height: USizes.spaceBtwItems),
              BannersDotNavigation(),

            ],
          );
        }
    );
  }
}