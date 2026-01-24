import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/shop/screens/orders/widgets/order_list_screen.dart';
import 'package:flutter/material.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('My Orders',style: Theme.of(context).textTheme.headlineMedium)),
      body: Padding(padding: UPading.screenPading, child: OrdersListItems(),),
    );
  }
}
