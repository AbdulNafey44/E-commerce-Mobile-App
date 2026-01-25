import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/customeshape/rounded_container.dart';
import 'package:e_commerce/common/widgets/screens/success_screen.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widgets/button/elevated_button.dart';
import '../../../../common/widgets/textfields/promo_code.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    return Scaffold(
      ///....[App Bar]...///
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),

      ///....[Body]...///
      body: SingleChildScrollView(
        child: Padding(
          padding: UPading.screenPading,
          child: Column(
            children: [
              /// Items
              UCartItems(showAddRemoveButtons: false),
              SizedBox(height: USizes.spaceBtwSections),

              /// promo code
              UPromoCodeField(),
              SizedBox(height: USizes.spaceBtwSections),

              /// Billing Section
              URoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(USizes.md),
                backgroundColor: Colors.transparent,
                child: Column(
                  children: [
                    /// Amount
                    UBillingAmountSection(),
                    SizedBox(height: USizes.spaceBtwItems),
                    Divider(),

                    /// Payment
                    UBillingPaymentSection(),
                    SizedBox(height: USizes.spaceBtwItems),

                    /// Address Section
                    BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      ///...bottom navigation
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(USizes.defaultSpace),
        child: UElevatedButton(
          onPressed: () => Get.to(
            SuccessScreen(
              title: 'Payment Success',
              subTitle: 'Yout Item will be shipped soon!',
              image: UImages.successfulPaymentIcon,
              onTap: () => Get.offAll(NavigationMenu()),
            ),
          ),
          child: Text('Checkout \$1200'),
        ),
      ),
    );
  }
}
