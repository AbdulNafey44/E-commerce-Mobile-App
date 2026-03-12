

import 'package:e_commerce/features/shop/controller/product/variation_controller.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class UBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());

  }

}