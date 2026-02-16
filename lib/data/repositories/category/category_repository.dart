


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/services/cloudinary_services.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';

class CategoryRepository extends GetxController{

  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());


/// [UploadCategory] - Function to upload list of categories
  Future<void> uploadCategories(List<CategoryModel> categories) async {
    try {
     for(final category in categories){
      File image = await UHelperFunction.assetToFile(category.image);
      dio.Response response = await  _cloudinaryServices.uploadImage(image, UKeys.categoryFolder);

      if(response.statusCode == 200){
        category.image = response.data['url'];
      }

      await _db.collection(UKeys.categoryCollection).doc(category.id).set(category.toJson());
      print('Category Uploaded: ${category.name}');
     }
    }  on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }
    on FormatException catch (_) {
      throw UFormatException();
    }
    on PlatformException catch (e) {
      throw UFormatException(e.code).message;
    }
    catch (e) {
      throw ' Something went Wrong. please try again';
    }
  }


/// [ FetchCategories ] /// Function to fetch list of categories
 Future<List<CategoryModel>> getAllCategories() async {
    try{
      final query = await _db.collection(UKeys.categoryCollection).get();
      if(query.docs.isNotEmpty){
        List<CategoryModel> categories = query.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
        return categories ;
      }
      return [];
    }
      on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    }
    on FormatException catch (_) {
      throw UFormatException();
    }
    on PlatformException catch (e) {
      throw UFormatException(e.code).message;
    }
    catch (e) {
      throw ' Something went Wrong. please try again';
    }
 }

}