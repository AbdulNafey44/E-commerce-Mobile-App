

import 'dart:convert';

import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/data/repositories/product/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavouriteController extends GetxController {

  static FavouriteController get instance => Get.find();

  /// variable
  RxMap<String, bool> favourites = <String , bool>{}.obs;
  final _storage = GetStorage(AuthenticationRepository.instance.currentUser!.uid);


  @override
  void onInit() {
    initFavourite();
    super.onInit();
  }

  Future<void> initFavourite() async {
  String? encodeFavourite =  _storage.read('favourites');
  if(encodeFavourite == null) return ;
  Map<String, dynamic> storedFavourites = jsonDecode(encodeFavourite) as Map<String, dynamic> ;
  favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value)));
  }

  void toggleFavouriteProduct(String productId){
    if(favourites.containsKey(productId)){
     favourites.remove(productId);
     saveFavouritesToString();
     USnackBarHelpers.customToast(message: 'Product has been removed from wishlist');
    }else{
    favourites[productId] = true ;
    saveFavouritesToString();
    USnackBarHelpers.customToast(message: 'Product has been added to the wishlist');
    }
  }
  void saveFavouritesToString() {
   String encodeFavourites = jsonEncode(favourites);
    _storage.write('favourites',encodeFavourites);
  }

  bool isFavourite(String productId){
    return favourites[productId] ?? false ;
  }

  Future<List<ProductModel>> getFavouriteProducts() async {
    final productsIds = favourites.keys.toList();
    return await ProductRepository.instance.getFavouriteProducts(productsIds);
  }

}