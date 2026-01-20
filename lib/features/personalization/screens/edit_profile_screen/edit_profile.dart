import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/user_profile_logo.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/edit_profile_screen/widgets/user_profile_with_edit_icon.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPading.screenPading,
          child: Column(
            children: [
              /// user profile with edit icon
              UserProfileWithEditIcon(),
              SizedBox(height: USizes.spaceBtwSections),
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),
              /// Account Settings Heading
              USectionHeading(
                title: 'Account Settings',
                showActionButton: false,
              ),
              /// Account Details
              UserDetailRow(title: 'Name', value: 'Abdul Nafey', onTap: (){},),
              UserDetailRow(title: 'username', value: 'naffy123', onTap: (){},),
              SizedBox(height: USizes.spaceBtwItems),
              /// Dividor
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),
              /// profile section heading
              USectionHeading(
                title: 'Profile Settings',
                showActionButton: false,
              ),
              SizedBox(height: USizes.spaceBtwItems,),
              UserDetailRow(title: 'User ID', value: '232345', onTap: (){},),
              UserDetailRow(title: 'Email', value: 'naffy123', onTap: (){},),
              UserDetailRow(title: 'Phone Number', value: '+923058135026', onTap: (){},),
              UserDetailRow(title: 'Gender', value: 'Male', onTap: (){},),

              Divider(),
              SizedBox(height: USizes.spaceBtwItems),
              TextButton(onPressed: (){}, child: Text('Close Account', style: TextStyle(color: Colors.red))),
            ],
          ),
        ),
      ),
    );
  }
}

class UserDetailRow extends StatelessWidget {
  const UserDetailRow({
    super.key,
    required this.title,
    required this.value,
    this.icon = Iconsax.arrow_right_34, required this.onTap,
  });

  final String title, value;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: USizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(child: Icon(icon, size: USizes.iconSm)),
          ],
        ),
      ),
    );
  }
}
