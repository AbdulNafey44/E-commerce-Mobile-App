import 'package:e_commerce/utils/constants/enum.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class UBrandTitleWithverifyIcon extends StatelessWidget {
  const UBrandTitleWithverifyIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = UColors.primary,
    this.textAlign = TextAlign.start,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: textColor ?? Theme.of(context).textTheme.titleMedium!.color,
            ),
          ),

          /// ✅ 2–3px visual gap
          const WidgetSpan(
            child: SizedBox(width: 3),
          ),

          /// ✅ Verify icon exactly with text
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Icon(
              Iconsax.verify5,
              size: 14,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}