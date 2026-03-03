
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {

  static ImageController get instance => Get.find();


  /// Variables
   RxString selectedProductImage = ''.obs;


  // Function load all images of product
   List<String> getAllProductImages(ProductModel product) {
     Set<String> images = {};

     // load thumbnail image
     images.add(product.thumbnail);
     // Assign thumbnail to selected image
     selectedProductImage.value = product.thumbnail;

     // load all images of product
     if(product.images != null && product.images!.isNotEmpty){
       images.addAll(product.images!);
     }

     // load all images from the product variation
     if(product.productVariations != null && product.productVariations!.isNotEmpty){
       List<String> variationImages = product.productVariations!.map((variation) => variation.image).toList();
       images.addAll(variationImages);
     }
     return images.toList();



   }

   void showEnlargeImage(String image){
   }
}