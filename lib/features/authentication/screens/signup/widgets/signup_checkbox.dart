import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/texts.dart';

class PrivacyPolicyCheckBox extends StatelessWidget {
  const PrivacyPolicyCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return Row(
      children: [
        Checkbox(value: true, onChanged: (value) {}),
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