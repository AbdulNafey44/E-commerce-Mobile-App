

import 'package:e_commerce/data/repositories/category/category_repository.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
   static CategoryController get find => Get.find();


   /// Variables
   final _repository = Get.put(CategoryRepository());
   RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
   RxList<CategoryModel> featureCategories = <CategoryModel>[].obs;

   RxBool isCategoriesLoading = false.obs;


   @override
   void onInit() {
     fetchCategories();
     super.onInit();
   }

   /// Function to fetch all categories & featured categories from firebase
   Future<void> fetchCategories() async {

     try{
       // start loading
       isCategoriesLoading.value = true ;
      // fetch categories
       List<CategoryModel> categories = await _repository.getAllCategories();
       allCategories.assignAll(categories);
       // get featured categories
       featureCategories.assignAll(categories.where((category) => category.isFeatured && category.parentId.isEmpty));
     }catch(e){
       USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString() );
     }
     finally {
       isCategoriesLoading.value = false ;
     }
   }

}