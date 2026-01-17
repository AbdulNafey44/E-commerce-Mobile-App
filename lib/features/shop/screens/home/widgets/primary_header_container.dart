import 'package:flutter/material.dart';

import '../../../../../common/widgets/customeshape/circular_container.dart';
import '../../../../../common/widgets/customeshape/clipper/rounded_edges.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/device_helpers.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({
    super.key, required this.child,
  });
  final Widget child ;
  @override
  Widget build(BuildContext context) {
    return URoundedEdgesContainer(
     child:  Container(
      height: USizes.homePrimaryHeaderHeight,
      color: UColors.primary,
      child: Stack(
        children: [
          //..circular container..//
          Positioned(
            top: -150,
            right: -160,
            child: UCircularContainer(
              height: USizes.homePrimaryHeaderHeight,
              width: USizes.homePrimaryHeaderHeight,
              backgroundColor: UColors.white.withValues(alpha: 0.1),
            ),
          ),
          //..circular container..//
          Positioned(
            top: 50,
            right: -250,
            child: UCircularContainer(
              height: USizes.homePrimaryHeaderHeight,
              width: USizes.homePrimaryHeaderHeight,
              backgroundColor: UColors.white.withValues(alpha: 0.1),
            ),
          ),
          ///
          child
        ],
      )),
    );
  }
}

