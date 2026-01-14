import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/device_helpers.dart';

class UCircularContainer extends StatelessWidget {
  const UCircularContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UDeviceHelper.getScreenHeight(context) * 0.4,
      width: UDeviceHelper.getScreenHeight(context) * 0.4,
      decoration: BoxDecoration(
        color: UColors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(500),
      ),
    );
  }
}