import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';


class UBrandTitleText extends StatelessWidget {
  const UBrandTitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Bata', style: Theme.of(context).textTheme.labelMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
        SizedBox(width: USizes.xs),
        Icon(Iconsax.verify5, color: UColors.primary, size: USizes.iconXs),
      ],
    );
  }
}