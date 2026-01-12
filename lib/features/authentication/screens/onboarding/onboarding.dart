import 'package:e_commerce/features/authentication/screens/onboarding/widget/onBoarding_page.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widget/onboardingdotnavigation.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widget/onboardingnextbutton.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widget/onboardingskipbutton.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';




import '../../../../utils/constants/sizes.dart';

import '../../controller/onboarding/onboarding_controller.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      backgroundColor: UColors.colorAlabasterGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
        child: Stack(
          children: [
            //scrolable page
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                onBoarding_page(animation: UImages.onboarding1Animation, title: UText.onBoardingTitle1, subtitle: UText.onBoardingSubtitle1, ),
                onBoarding_page(animation: UImages.onboarding2Animation, title: UText.onBoardingTitle2, subtitle: UText.onBoardingSubtitle2, ),
                onBoarding_page(animation: UImages.onboarding3Animations, title: UText.onBoardingTitle3, subtitle: UText.onBoardingSubtitle3, ),


              ],

            ),
            //Indicator
            onBoardingDotNavigation(),
            //bottom button
            onBoardingNextButton(),
            //skip button
            onBoardingSkipButton(),

          ],

        ),
      ),
    );

  }
}











