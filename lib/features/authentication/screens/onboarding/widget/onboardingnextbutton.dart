import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../controller/onboarding/onboarding_controller.dart';
class onBoardingNextButton extends StatelessWidget {
  const onBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      left: 0,
      right: 0,
      bottom: USizes.spaceBtwItems,
      child: UElevatedButton(
        onPressed: controller.nextPage,
        child: Obx(()=> Text(controller.currentIndex.value ==2 ? 'GetStarted' : 'Next')),
      ),
    );
  }
}
