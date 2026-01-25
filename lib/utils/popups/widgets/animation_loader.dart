
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../constants/sizes.dart';


class UAnimationLoader extends StatelessWidget {
  const UAnimationLoader({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Animation
          Lottie.asset('assets/animations/loading.json', width: Get.width * 0.8),
          const SizedBox(height: USizes.defaultSpace),

          /// Title
          Text(text, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
          const SizedBox(height: USizes.defaultSpace),
        ],
      ),
    );
  }
}
