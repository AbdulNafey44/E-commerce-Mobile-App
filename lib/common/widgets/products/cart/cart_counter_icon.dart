import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_function.dart';

class UCartCounterIcon extends StatelessWidget {
  const UCartCounterIcon({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunction.isDarkMode(context);
    return Stack(
      children: [
        //...bag / cart icon
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.shopping_cart),
          color: dark ? UColors.dark : UColors.light,
        ),
        //..count text..//
        Positioned(
          right: 6.0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: dark ? UColors.dark : UColors.light,
                shape: BoxShape.circle),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!
                    .apply(
                  fontSizeFactor: 0.8,
                  color: dark ? UColors.dark : UColors.light,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}