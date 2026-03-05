
import 'package:e_commerce/data/repositories/product/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/enum.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {

   static ProductController get instance => Get.find();

   /// Variables
   final _repository = Get.put(ProductRepository());
   RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
   RxList<ProductModel> allProducts = <ProductModel>[].obs;
   RxBool isLoading = false.obs;

   @override
  void onInit() {
     getFeaturedProduct();
     super.onInit();

  }
  /// Function to fetch only 4 featured products
  Future<void> getFeaturedProduct() async{
     try{

       // Start Loading
       isLoading.value = true ;
       // fetch featured products
       List<ProductModel> featuredProducts = await  _repository.fetchFeaturedProducts();
       // assign featured products
       this.featuredProducts.assignAll(featuredProducts);

     }catch(e){
       USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
     }
     finally{
       // stop loading
       isLoading.value = false ;
     }
   }

   /// Function to fetch all featured products
   Future<List<ProductModel>> getAllFeaturedProduct() async{
     try{

       // fetch featured products
       List<ProductModel> featuredProducts = await  _repository.fetchAllFeaturedProducts();
       return featuredProducts;


     }catch(e){
       USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
       return [];
     }
   }



   /// Calculate sale percentage
   String? calculateSalePercentage(double orignalPrice, double? salePrice){
     if(salePrice == null || salePrice <= 0.0)return null;
     if(orignalPrice <= 0.0) return null;

     // calculate sale percentage
     double percentage = ((orignalPrice - salePrice) / orignalPrice) * 100 ;
     return percentage.toStringAsFixed(1);
   }
    /// Get product price or price range for variable products
   String getProductPrice(ProductModel product){
     double smallestPrice = double.infinity;
     double largestPrice = 0.0;

     if(product.productType == ProductType.single.toString()){
       return product.salePrice > 0 ? product.salePrice.toString() : product.price.toString();
     }else {
      // calculate the smallest and largest price among variations
       for(final variation in product.productVariations!){
         double variationPrice = variation.salePrice > 0 ? variation.salePrice : variation.price ;
         if(variationPrice > largestPrice ){
           largestPrice = variationPrice ;
         }
         if(variationPrice < smallestPrice){
           smallestPrice = variationPrice ;
         }
       }
       if(smallestPrice.isEqual(largestPrice)){
         return largestPrice.toStringAsFixed(0);
       }else{
         return '${largestPrice.toStringAsFixed(0)} - ${UText.currency}${smallestPrice.toStringAsFixed(0)}';
       }
     }
     }

     /// Get product stock status
     String getProductStatus(int stock){
     return stock > 0 ? 'in stock' : 'out of stock';
     }

   /// Function to fetch all products
   Future<void> getAllProducts() async {
     try {
       // Start Loading
       isLoading.value = true;

       // fetch all products from repository
       List<ProductModel> allProductsList = await _repository.fetchAllProducts();

       // assign to controller variable
       this.allProducts.assignAll(allProductsList);

       debugPrint('Total all products fetched: ${allProductsList.length}');

     } catch (e) {
       USnackBarHelpers.errorSnackBar(
         title: 'Failed',
         message: e.toString(),
       );
     } finally {
       // stop loading
       isLoading.value = false;
     }
   }
   }

