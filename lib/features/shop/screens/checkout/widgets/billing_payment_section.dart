import 'package:e_commerce/common/widgets/customeshape/rounded_container.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';


class UBillingPaymentSection extends StatelessWidget {
  const UBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    return Column(
      children: [

        /// [Text]...Payment Method ///
        USectionHeading(title: 'Payment Method', buttonTitle: 'change',onPressed: (){},),
        SizedBox(height: USizes.spaceBtwItems /2),
        Row(
          children: [
            /// Payment Logo
            URoundedContainer(
              height: 35,
              width: 60,
              backgroundColor: dark ? UColors.light : UColors.white,
              padding: EdgeInsets.all(USizes.sm),
              child: Image(image: AssetImage(UImages.googlePay), fit: BoxFit.contain),
            ),
            SizedBox(height: USizes.spaceBtwItems/2),
            /// Payment Name
            Text('Google Pay',style: Theme.of(context).textTheme.bodyLarge),
          ],
        )

      ],
    );
  }
}
