import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/customeshape/circular_container.dart';
import '../../../utils/helpers/device_helpers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       height: UDeviceHelper.getScreenHeight(context) * 0.4,
        color: UColors.primary,
        child: Stack(
          children: [
           Positioned(
             top: -150,
             right: -160,
             child: UCircularContainer(),
           ),
            Positioned(
              top: 50,
              right: -250,
              child: UCircularContainer(),
            ),
          ],
        ),
      ),
    );
  }
}



