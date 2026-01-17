import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../style/shadow.dart';

class UProductCard extends StatelessWidget {
  const UProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: UShadow.verticalProductShadow,
        borderRadius: BorderRadius.circular(USizes.productImageRadius),
      ),
    );
  }
}