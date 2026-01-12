import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/theme/widgets_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Column(
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

                  SizedBox(height: USizes.spaceBtwSections,),
                  ///.....email phone password...///
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: UText.signUpEmail,
                      prefixIcon: Icon(Iconsax.direct_right),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwInputFields * 1.5,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: UText.phone,
                      prefixIcon: Icon(Iconsax.mobile),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwInputFields * 1.5,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: UText.signUpPassword,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: Icon(Iconsax.eye),
                    ),
                  ),
                  //...check box...///
                  Row(
                    children: [],
                  )
                ],
              ),
              //....Dividor....///

              //...Footer...///
            ],
          ),
        ),
      ),
    );
  }
}
