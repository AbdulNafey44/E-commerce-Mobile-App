import 'package:e_commerce/features/authentication/screens/signup/widgets/signup_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../common/widgets/button/social_button.dart';
import '../../../../../common/widgets/login_signup/form_divider.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
class USignupForm extends StatelessWidget {
  const USignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: UText.firstName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
            SizedBox(width: USizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: UText.lastName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: USizes.spaceBtwSections),

        ///.....email phone password...///
        TextFormField(
          decoration: InputDecoration(
            labelText: UText.signUpEmail,
            prefixIcon: Icon(Iconsax.direct_right),
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields * 1.5),
        TextFormField(
          decoration: InputDecoration(
            labelText: UText.phone,
            prefixIcon: Icon(Iconsax.call),
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields * 1.5),
        TextFormField(
          decoration: InputDecoration(
            labelText: UText.signUpPassword,
            prefixIcon: Icon(Iconsax.password_check),
            suffixIcon: Icon(Iconsax.eye),
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields,),
        //...check box...///
        PrivacyPolicyCheckBox(),
        SizedBox(height: USizes.spaceBtwItems,),

        UElevatedButton(onPressed: (){}, child: Text(UText.createAccount)),

        SizedBox(height: USizes.spaceBtwSections),
        //....Dividor....///
        UFormDivider(title: UText.orSigupWith),
        SizedBox(height: USizes.spaceBtwSections,),
        //...Footer...///
        USocialButtons(),
      ],
    );
  }
}

