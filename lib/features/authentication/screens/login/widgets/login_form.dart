import 'package:e_commerce/features/authentication/screens/forgetpassword/forget_password.dart';
import 'package:e_commerce/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';


class ULoginForm extends StatelessWidget {
  const ULoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Email
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            labelText: UText.email,
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields),
        //password
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            labelText: UText.password,
            suffixIcon: Icon(Iconsax.eye),
          ),
        ),

        SizedBox(height: USizes.spaceBtwInputFields),
        ///Rememberme & forget password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //remeber me
            Row(
              children: [
                Checkbox(value: true, onChanged: (context) {}),
                Text(UText.rememberMe),
              ],
            ),
            //forget password
            TextButton(onPressed: () => Get.to(() => ForgetPassword()), child: Text(UText.forgetPassword)),
          ],
        ),
        SizedBox(height: USizes.spaceBtwSections),
        //signing
        UElevatedButton(onPressed: () => Get.to(() => NavigationMenu()), child: Text(UText.signIn)),
        SizedBox(height: USizes.spaceBtwItems / 2),
        //create account
        SizedBox(
          height: 54,
          width: double.infinity,
            child: OutlinedButton(onPressed: () => Get.to(() => SignupScreen()),child: Text(UText.createAccount))),
        SizedBox(height: 1,)
      ],
    );
  }
}