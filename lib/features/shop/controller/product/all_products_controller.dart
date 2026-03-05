
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/repositories/product/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController{

  static AllProductsController get instance => Get.find();

    final _repository = ProductRepository.instance;
    final RxString selectedSortOption = 'name'.obs;
    final RxList<ProductModel> products = <ProductModel>[].obs;

    /// fetch products using query
  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try{
        if(query == null) return [];

     List<ProductModel> products = await _repository.fetchProductsByQuery(query);
     return products ;
    }catch(e){
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
      return [];
    }
  }

  /// function to sort products
  void  sortProducts(String sortOption){
    selectedSortOption.value = sortOption;

    switch(sortOption){
      case 'Name' :
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Lower Price' :
        products.sort((a,b) => a.price.compareTo(b.price));
        break ;
      case 'Higher Price' :
        products.sort((a,b) => b.price.compareTo(a.price));
        break ;
      case 'Newest' :
        products.sort((a,b) => a.date!.compareTo(b.date!));
        break ;
      case 'Sale' :
        products.sort((a,b) {
          if(b.salePrice > 0){
            return b.salePrice.compareTo(a.salePrice);
          }else if (a.salePrice > 0){
            return -1;
          }else {return 1; }
        });
      default :
    }
  }

  /// function to assign products
  void assignProducts(List<ProductModel> products){
    this.products.assignAll(products);
    sortProducts('Name');
  }
}