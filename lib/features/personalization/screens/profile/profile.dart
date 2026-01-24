
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_primary_header.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/settings_menu_tile.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/user_profile_tile.dart';

import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../shop/screens/orders/order.dart';
import '../addresses/address.dart';

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
                 SettingProfileTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set shopping delivery addresses',onTap: ()=> Get.to(AddressScreen()),),
                 SettingProfileTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove products and move to checkout',onTap: (){},),
                 SettingProfileTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-progress and Completed Orders',onTap: ()=>Get.to(OrderScreen()),),
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






