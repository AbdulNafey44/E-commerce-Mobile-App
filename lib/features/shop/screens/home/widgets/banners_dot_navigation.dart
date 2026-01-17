import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannersDotNavigation extends StatelessWidget {
  const BannersDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      count: 3,
      effect: ExpandingDotsEffect(
          dotHeight: 6.0
      ), controller: PageController(),
    );
  }
}