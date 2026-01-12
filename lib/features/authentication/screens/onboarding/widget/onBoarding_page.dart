import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../utils/helpers/device_helpers.dart';

class onBoarding_page extends StatelessWidget {
  const onBoarding_page({
    super.key, required this.animation, required this.title, required this.subtitle,
  });

  final String animation ;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only( top: UDeviceHelper.getAppBarHeight()),
      child: Column(
        children: [
          //animation
          Lottie.asset(animation),
          //Title
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          //subtitle
          Text(subtitle, textAlign: TextAlign.center,),

        ],
      ),
    );
  }
}