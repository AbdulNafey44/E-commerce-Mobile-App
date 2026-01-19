import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/store_primary_header.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/textfields/search_bar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../home/widgets/home_appbar.dart';
import '../home/widgets/home_categories.dart';
import '../home/widgets/primary_header_container.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              expandedHeight: USizes.storePrimaryHeaderHeight + 10,
              flexibleSpace: UStorePrimaryHeader(),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}

