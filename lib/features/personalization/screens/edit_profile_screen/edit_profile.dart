import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/user_profile_logo.dart';
import 'package:e_commerce/features/personalization/screens/edit_profile_screen/widgets/user_profile_with_edit_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar( showBackArrow: true,  title: Text('Edit Profile',style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPading.screenPading ,
          child: Column(
            children: [
              UserProfileWithEditIcon()
            ],
          ),
        ),
      ),
    );
  }
}


