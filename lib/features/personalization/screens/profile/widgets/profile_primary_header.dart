import 'package:e_commerce/common/widgets/images/user_profile_logo.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/customeshape/primary_header_container.dart';
import '../../../../../utils/constants/sizes.dart';


class UProfilePrimaryHeader extends StatelessWidget {
  const UProfilePrimaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///total height
        SizedBox(height: USizes.profilePrimaryHeaderHeight + 60),
        ///primary header
        UPrimaryHeaderContainer(child: Container(), height: USizes.profilePrimaryHeaderHeight),
        ///user profile image
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: UserProfileLogo(),
            )),

      ],
    );
  }
}

