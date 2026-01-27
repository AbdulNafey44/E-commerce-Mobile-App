import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../edit_profile_screen/edit_profile.dart';


class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = userController.instance;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Obx(() => Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall,)),
      subtitle:   Obx(() => Text(controller.user.value.email,style: Theme.of(context).textTheme.bodyMedium)),
      trailing: IconButton(onPressed: () => Get.to(()=>(EditProfileScreen())), icon: Icon(Iconsax.edit)),
    );
  }
}