import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/data/services/cloudinary_services.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/constants/apis.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import 'package:dio/dio.dart' as dio;

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  /// variable

  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());


  /// function to store user data
   Future<void> saveUserRecord(UserModel user) async {
     try {
      await _db.collection(UKeys.userCollection).doc(user.id).set(user.toJson());
     }
     on FirebaseAuthException catch(e){
       throw UFirebaseAuthException(e.code).message;
     }
     on FirebaseException catch(e){
       throw UFirebaseException(e.code).message;
     }
     on FormatException catch(_){
       throw UFormatException();
     }
     on PlatformException catch(e){
       throw UFormatException(e.code).message;
     }
     catch(e) {
       throw ' Something went Wrong. please try again';
     }
   }
    /// [Read] - function to fetch user details based on current user
   Future<UserModel> fetchUserDetails() async {
     try {
      final documentSnapshot = await _db.collection(UKeys.userCollection).doc(AuthenticationRepository.instance.currentUser!.uid).get();

      if(documentSnapshot.exists){
        UserModel user =  UserModel.fromSnapshot(documentSnapshot);
        return user;
      }
      return UserModel.empty();

     } on FirebaseAuthException catch (e) {
       throw UFirebaseAuthException(e.code).message;
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
   /// [Update] Function to update user single field
   Future<void> updateSingleField(Map<String, dynamic> map) async {
     try {

     await  _db.collection(UKeys.userCollection).doc(AuthenticationRepository.instance.currentUser!.uid).update(map);
     } on FirebaseAuthException catch (e) {
       throw UFirebaseAuthException(e.code).message;
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

   /// Function to delete user account from fire store
  Future<void> removeUserRecord(String userId) async {
    try {

   await _db.collection(UKeys.userCollection).doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
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


  /// [UploadImage] - Function to upload image
  Future<dio.Response> uploadImage(File image) async {
     try{
      dio.Response response =  await  _cloudinaryServices.uploadImage(image, UKeys.profileFolder);
       return response ;

     }catch(e){
       debugPrint('Error while upload profile:$e');
       throw 'Failed to upload image. please try again';
     }
  }
  /// [DeleteImage] - Function to delete profile picture
  Future<dio.Response> deleteProfilePicture(String publicId) async {
     try{
     dio.Response response = await _cloudinaryServices.deleteImage(publicId);
       return response ;
     }catch(e){
       throw 'Something went wrong. please try again';
     }
  }

}