import 'package:flutter/material.dart';

import '../../../../../common/widgets/customeshape/circular_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/device_helpers.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UDeviceHelper.getScreenHeight(context) * 0.4,
      color: UColors.primary,
      child: Stack(
        children: [
          //..circular container..//
          Positioned(
            top: -150,
            right: -160,
            child: UCircularContainer(
              height: UDeviceHelper.getScreenHeight(context)*0.4,
              width: UDeviceHelper.getScreenHeight(context)*0.4,
              backgroundColor: UColors.white.withValues(alpha: 0.1),
            ),
          ),
          //..circular container..//
          Positioned(
            top: 50,
            right: -250,
            child: UCircularContainer(
              height: UDeviceHelper.getScreenHeight(context)*0.4,
              width: UDeviceHelper.getScreenHeight(context)*0.4,
              backgroundColor: UColors.white.withValues(alpha: 0.1),
            ),
          ),
        ],
      ),
    );
  }
}