import 'package:flutter/material.dart';


class UProductTitleText extends StatelessWidget {
  const UProductTitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Blue Bata Shoes', style: Theme.of(context).textTheme.labelLarge);
  }
}