import 'package:flutter/material.dart';

import '../../../../../common/widgets/customeshape/circular_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class UHomeCategories extends StatelessWidget {
  const UHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          UText.categoriesTitle,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.apply(color: UColors.white),
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ///circular image ..///
                  UCircularContainer(
                      height: 56, width: 56,
                   child:
                  ),

                  //...Title..//
                  SizedBox(
                    width: 55,
                    child: Text(
                      'Sports',
                      style: Theme.of(context).textTheme.labelMedium!
                          .apply(color: UColors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}