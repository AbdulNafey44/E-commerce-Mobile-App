import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';


import '../../../../../common/widgets/text/section_heading.dart';


class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        USectionHeading(title: 'Shipping Address', buttonTitle: 'change',onPressed: (){},),
        Text('Abdul Nafey', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: USizes.spaceBtwItems/2),
        Row(
          children: [
            Icon(Icons.phone, size: USizes.iconSm,color: UColors.darkerGrey),
            SizedBox(width: USizes.spaceBtwItems/2,),
            Text('+92 3058135026'),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/2),
        Row(
          children: [
            Icon(Icons.location_history,size: USizes.iconSm,color: UColors.darkerGrey),
            SizedBox(width: USizes.spaceBtwItems/2),
            Text('House No.295, Punjab, Pakpattan, Pakistan', softWrap: true,)
          ],
        )

      ],
    );
  }
}
