import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';


import '../../../../common/widgets/customeshape/circular_container.dart';
import '../../../../utils/helpers/device_helpers.dart';
import 'primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UPrimaryHeaderContainer(),
    );
  }
}





