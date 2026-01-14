import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_counter_icon.dart';
import '../../../../../utils/constants/colors.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning',
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: UColors.grey),
          ),
          Text(
            'Abdul Nafey',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: UColors.white),
          ),
        ],
      ),
      actions: [
        UCartCounterIcon(),
      ],
    );
  }
}