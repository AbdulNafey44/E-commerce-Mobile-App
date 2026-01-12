import 'package:e_commerce/common/style/padding.dart';

import 'package:e_commerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_header.dart';


import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';

import 'package:flutter/material.dart';


import '../../../../common/widgets/button/social_button.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPading.screenPading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///.....Header...///
              ///...Title & Subtitle ...///
              ULoginHeader(),
              SizedBox(height: USizes.spaceBtwSections),
              ///....Form...///
              ///email & password textfield
              ULoginForm(),
              ///...Dividor...///
              SizedBox(height: USizes.spaceBtwSections  ),
             UFormDivider(title: UText.orSignWith,),
              SizedBox(height: USizes.spaceBtwSections),
              ///...Footer...///
              ///...Social Buttons...///
               USocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}






