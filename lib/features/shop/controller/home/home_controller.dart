

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

static HomeController get instance => Get.find();


///Variables//
 final carouselController = CarouselSliderController() ;

 RxInt currentIndex = 0.obs;

 ///on page change ///
  void onPageChanged(int index){
    currentIndex.value =index;
  }
}