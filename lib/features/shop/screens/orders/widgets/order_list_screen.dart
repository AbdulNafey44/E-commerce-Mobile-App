import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/customeshape/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class OrdersListItems extends StatelessWidget {
  const OrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunction.isDarkMode(context);
    return  ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: USizes.spaceBtwItems),
      itemCount: 4,
      itemBuilder: (context, index) {
      return URoundedContainer(
        showBorder: true,
        backgroundColor: dark? UColors.dark : UColors.light,
        padding: EdgeInsets.all(USizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// row-1
            Row(
              children: [
                /// ship icon
                Icon(Iconsax.ship),
                SizedBox(width: USizes.spaceBtwItems/2,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Text('Processing',style: Theme.of(context).textTheme.bodyLarge!.apply(color: UColors.primary, fontWeightDelta: 10)),
                      /// Date
                      Text('23 Jan 2025',style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                /// Right arrow button
                IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34, size: USizes.iconSm))
              ],
            ),
            SizedBox(height: USizes.spaceBtwItems),
            /// Row-2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// tag icon
                      Icon(Iconsax.tag),
                      SizedBox(width: USizes.spaceBtwItems/2,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// order text
                            Text('Order',style: Theme.of(context).textTheme.labelMedium),
                            /// order id
                            Text('23533',style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    children: [
                      /// calender icon
                      Icon(Iconsax.calendar),
                      SizedBox(width: USizes.spaceBtwItems/2,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// shipping text
                            Text('Shipping',style: Theme.of(context).textTheme.labelMedium),
                            /// shipping Date
                            Text('25 Jan 2025',style: Theme.of(context).textTheme.titleMedium),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },);
  }
}
