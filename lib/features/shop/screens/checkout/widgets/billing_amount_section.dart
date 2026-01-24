import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';


class UBillingAmountSection extends StatelessWidget {
  const UBillingAmountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Subtotal
        Row(children: [
          Expanded(child: Text('Subtotal',style: Theme.of(context).textTheme.bodyMedium)),
          Text('\$7997.0',style: Theme.of(context).textTheme.bodyMedium),
        ],),
        SizedBox(height: USizes.spaceBtwItems/2),
        /// Shipping Fee
        Row(children: [
          Expanded(child: Text('Shipping Fee',style: Theme.of(context).textTheme.bodyMedium)),
          Text('\$79.0',style: Theme.of(context).textTheme.labelLarge),
        ],),
        SizedBox(height: USizes.spaceBtwItems/2),
        /// Tax Fee
        Row(children: [
          Expanded(child: Text('Tax Fee',style: Theme.of(context).textTheme.bodyMedium)),
          Text('\$79.0',style: Theme.of(context).textTheme.bodyMedium),
        ],),
        SizedBox(height: USizes.spaceBtwItems/2),
        /// Order Total
        Row(children: [
          Expanded(child: Text('Order Total',style: Theme.of(context).textTheme.titleLarge)),
          Text('\$9245.0',style: Theme.of(context).textTheme.titleMedium),
        ],),

      ],
    );
  }
}