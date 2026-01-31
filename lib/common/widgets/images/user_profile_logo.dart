import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = userController.instance;

    return
      Obx(
        () {
          bool isProfileAvailable = controller.user.value.profilePicture.isNotEmpty;
          if(controller.isProfileUploading.value){
            return UShimmerEffect(width: 120, height: 120, radius: 120);
          }
          return  UCircularImage(image: isProfileAvailable ?controller.user.value.profilePicture : UImages.profileLogo,
            isNetworkImage: isProfileAvailable ? true : false,
            height: 120.0,
            width: 120.0,
            borderWidth: 5.0,
            padding: 0,);
        }
      );
  }
}