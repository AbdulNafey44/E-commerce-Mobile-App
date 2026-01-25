import 'package:e_commerce/features/authentication/controller/signup/signup_controller.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/texts.dart';

class PrivacyPolicyCheckBox extends StatelessWidget {
  const PrivacyPolicyCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
       Obx (() => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value )),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(text: ' ${UText.iAgreeTo}'),
              TextSpan(
                text: UText.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!
                    .copyWith(
                  color: dark ? UColors.white : UColors.primary,
                  decoration:  TextDecoration.underline,
                  decorationColor: dark ? UColors.white : UColors.primary,
                ),
              ),
              TextSpan(text: ' ${UText.and}'),
              TextSpan(
                text: ' ${UText.termsOfUse}',
                style: Theme.of(context).textTheme.bodyMedium!
                    .copyWith(
                  color: UColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: UColors.primary,
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}