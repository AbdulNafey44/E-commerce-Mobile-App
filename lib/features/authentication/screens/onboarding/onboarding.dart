import 'package:e_commerce/features/authentication/screens/onboarding/widget/onBoarding_page.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widget/onboardingdotnavigation.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widget/onboardingnextbutton.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widget/onboardingskipbutton.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';
import '../../controller/onboarding/onboarding_controller.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
          child: Stack(
            children: [
              /// Pages
              PageView(
                controller: controller.pageController,
                onPageChanged: controller.updatePageIndicator,
                children: const [
                  onBoarding_page(
                    animation: UImages.onboarding1Animation,
                    title: UText.onBoardingTitle1,
                    subtitle: UText.onBoardingSubtitle1,
                  ),
                  onBoarding_page(
                    animation: UImages.onboarding2Animation,
                    title: UText.onBoardingTitle2,
                    subtitle: UText.onBoardingSubtitle2,
                  ),
                  onBoarding_page(
                    animation: UImages.onboarding3Animations,
                    title: UText.onBoardingTitle3,
                    subtitle: UText.onBoardingSubtitle3,
                  ),
                ],
              ),

              /// Skip
              const onBoardingSkipButton(),

              /// Dots
              const onBoardingDotNavigation(),

              /// Next Button
              const onBoardingNextButton(),
            ],
          ),
        ),
      ),
    );
  }
}
