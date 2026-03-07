import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/features/shop/controller/product/image_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../common/widgets/products/favourite/favourite_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';

class UProductThumbnailAndSlider extends StatelessWidget {
  const UProductThumbnailAndSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    final controller = Get.put(ImageController());
    List<String> images = controller.getAllProductImages(product);
    return Container(
      color: dark ? UColors.dark : UColors.light,
      child: Stack(
        children: [
          ///image thumbnail
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(USizes.productImageRadius * 2),
              child: Center(
                child: Obx(
                      (){
                        final image = controller.selectedProductImage.value;
                        return GestureDetector(
                          onTap: () => controller.selectedProductImage.value,
                          child: CachedNetworkImage(
                            imageUrl: image,
                            progressIndicatorBuilder: (context, url, progress) =>
                                CircularProgressIndicator(
                                  color: UColors.primary,
                                  value: progress.progress,
                                ),
                          ),
                        );
                      }
                ),
              ),
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
                separatorBuilder: (context, index) =>
                    SizedBox(width: USizes.spaceBtwItems),
                itemCount: images.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Obx(
                  (){
                    bool isImageSelected = controller.selectedProductImage.value == images[index];
                    return URoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      ontap: () => controller.selectedProductImage.value = images[index],
                      backGroundColor: dark ? UColors.dark : UColors.white,
                      padding: EdgeInsets.all(USizes.sm),
                      border: Border.all(color: isImageSelected ? UColors.primary : Colors.transparent),
                      imageUrl: (images[index]),
                    );
                  }
                ),
              ),
            ),
          ),

          /// back arrow and fav icon ///
          UAppBar(
            showBackArrow: true,
            actions: [UFavouriteIcon(productId: product.id)],
          ),
        ],
      ),
    );
  }
}
