import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';



class UProductThumbnailAndSlider extends StatelessWidget {
  const UProductThumbnailAndSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark? UColors.dark: UColors.light,
      child: Stack(
        children: [
          ///image thumbnail
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(
                USizes.productImageRadius * 2,
              ),
              child: Center(child: Image(image: AssetImage(UImages.productImage28))),
            ),
          ),
          /// Image Slider
          Positioned(
            left: USizes.defaultSpace,
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => URoundedImage(
                  width: 80,
                  backGroundColor: dark ? UColors.dark : UColors.white,
                  padding: EdgeInsets.all(USizes.sm),
                  border: Border.all(color: UColors.primary),
                  imageUrl: (UImages.productImage27),
                ),
                separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems,),
                itemCount: 6,
              ),
            ),
          ),
          /// back arrow and fav icon ///
          UAppBar(
            showBackArrow: true,
            actions: [
              UCircularIcon(icon: Iconsax.heart5, color: Colors.red,),
            ],
          )
        ],
      ),
    );
  }
}
