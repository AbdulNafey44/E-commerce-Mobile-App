import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/user_profile_logo.dart';


class UserProfileWithEditIcon extends StatelessWidget {
  const UserProfileWithEditIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = userController.instance;
    return Stack(
      children: [
        Center(child: UserProfileLogo()),
        Obx(
                () {
              if (controller.isProfileUploading.value) {
                return SizedBox();
              }
              return Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(child: UCircularIcon(icon: Iconsax.edit,
                    onPressed: controller.updateUserProfilePicture,)));
            }
        ),
      ],
    );
  }
}