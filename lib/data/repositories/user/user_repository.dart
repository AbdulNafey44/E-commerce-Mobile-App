import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  /// variable

  final _db = FirebaseFirestore.instance;



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
}