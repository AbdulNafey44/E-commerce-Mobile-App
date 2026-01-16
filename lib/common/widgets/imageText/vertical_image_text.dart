import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../customeshape/circular_container.dart';


class UVerticalImageText extends StatelessWidget {
  const UVerticalImageText({
    super.key,
    required this.title,
    required this.image,
    required this.textColor,
    this.backgroundColor,
    this.onTap,
  });

  final String title, image;

  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ///circular image ..///
          UCircularContainer(
            height: 56,
            width: 56,
            backgroundColor: backgroundColor ?? (dark? UColors.dark : UColors.light),
            padding: EdgeInsets.all(USizes.sm),
            child: Image(image: AssetImage(image), fit: BoxFit.cover),
          ),
          SizedBox(height: USizes.spaceBtwItems / 3),
          //...Title..//
          SizedBox(
            width: 55,
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}