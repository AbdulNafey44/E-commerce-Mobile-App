import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';
import 'banners_dot_navigation.dart';

class UPromeSlider extends StatelessWidget {
  const UPromeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}