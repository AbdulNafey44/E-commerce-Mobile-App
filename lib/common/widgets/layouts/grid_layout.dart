import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../products/product_card/product_card_vertical.dart';

class UGridLayout extends StatelessWidget {
  const UGridLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            mainAxisSpacing: USizes.gridViewSpacing,
            crossAxisSpacing: USizes.gridViewSpacing,
            mainAxisExtent: 288),

        itemBuilder: (context, index){
          return UProductCard();

        });
  }
}