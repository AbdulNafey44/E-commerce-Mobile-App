import 'package:e_commerce/features/authentication/controller/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';

class USocialButtons extends StatelessWidget {
  const USocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google button
        buildButton(
          UImages.googleIcon,
              () async {
            await controller.googleSignIn(); // call the controller function
          },
        ),
        SizedBox(width: USizes.spaceBtwItems),
        // Facebook button (currently empty)
        buildButton(UImages.facebookIcon, () {}),
      ],
    );
  }

  Container buildButton(String image, VoidCallback onpressed) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: UColors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onpressed, // ✅ call the correct callback
        icon: Image.asset(
          image,
          height: USizes.iconMd,
          width: USizes.iconMd,
        ),
      ),
    );
  }
}
