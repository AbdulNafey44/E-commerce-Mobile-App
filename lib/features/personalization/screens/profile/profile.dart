import 'package:e_commerce/common/widgets/customeshape/primary_header_container.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_primary_header.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/settings_menu_tile.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/user_profile_tile.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UProfilePrimaryHeader(),
           Padding(
             padding: const EdgeInsets.all(USizes.defaultSpace ),
             child: Column(
               children: [
                 UserProfileTile(),
                 SizedBox(height: USizes.spaceBtwItems,),
                 /// Account Setting heading
                 USectionHeading(title: 'Account Settings', showActionButton: false,),
                 /// setting menu
                 SettingProfileTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set shopping delivery addresses',),
                 SettingProfileTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove products and move to checkout',),
                 SettingProfileTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-progress and Completed Orders',),
                 SizedBox(height: USizes.spaceBtwSections * 2),
                 SizedBox(
                     width: double.infinity,
                     child: OutlinedButton(onPressed: (){}, child: Text('Log Out'))),
                 SizedBox(height: USizes.spaceBtwSections),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}






