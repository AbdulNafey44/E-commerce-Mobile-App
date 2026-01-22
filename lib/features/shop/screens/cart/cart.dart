
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return Scaffold(
      ///...[App Bar]...///
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
      ),

      ///...[Body]...///
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Row(
            children: [
              /// Product Image
              URoundedImage(
                imageUrl: UImages.productImage4a,
                height: 60,
                width: 60,
                padding: EdgeInsets.all(USizes.sm),
                backGroundColor: dark ? UColors.darkerGrey : UColors.light,
              ),
              /// Brand , Name , Variation
               Expanded(child: )
            ],
          );
        },
      ),
    );
  }
}


