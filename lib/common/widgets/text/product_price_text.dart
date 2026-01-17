import 'package:flutter/material.dart';


class UProductPriceText extends StatelessWidget {
  const UProductPriceText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('\$199', style: Theme.of(context).textTheme.headlineMedium, maxLines: 1, overflow: TextOverflow.ellipsis);
  }
}