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
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('Abdul Naffy', style: Theme.of(context).textTheme.headlineSmall,),
      subtitle: Text('example@gmail.com',style: Theme.of(context).textTheme.bodyMedium),
      trailing: IconButton(onPressed: () => Get.to(()=>(EditProfileScreen())), icon: Icon(Iconsax.edit)),
    );
  }
}