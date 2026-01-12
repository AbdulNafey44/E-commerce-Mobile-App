import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child:  Padding(
          padding: UPading.screenPading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           Text(UText.forgetPassword, style: Theme.of(context).textTheme.headlineMedium),
           Text(UText.forgetPasswordSubTitle, style: Theme.of(context).textTheme.bodySmall,),
           SizedBox(height: USizes.spaceBtwSections,),
              SizedBox(height: USizes.spaceBtwSections,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: UText.signUpEmail,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              SizedBox(height: USizes.spaceBtwInputFields,),
              UElevatedButton(onPressed: (){}, child: Text(UText.forgetPasswordSubmit)),
            ],
          ),
        ),
      ),
    );
  }
}
