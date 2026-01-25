import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/features/authentication/controller/signup/signup_controller.dart';

import 'package:e_commerce/features/authentication/screens/signup/widgets/signup_form.dart';

import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPading.screenPading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //......Header....//
              Text(
                UText.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwSections),
              //.....Form....///
              USignupForm(),

            ],
          ),
        ),
      ),
    );
  }
}


