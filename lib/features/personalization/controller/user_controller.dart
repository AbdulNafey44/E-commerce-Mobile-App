import 'dart:io';

import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/personalization/screens/edit_profile_screen/widgets/re_authenticate_user_form.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

class userController extends GetxController{

  static userController get instance => Get.find();

  /// Variables
 final _userRepository = Get.put(UserRepository());
 Rx<UserModel> user = UserModel.empty().obs;
 RxBool profileLoading = false.obs;
 RxBool isProfileUploading = false.obs;
 /// Re-authenticate form variables
  final email = TextEditingController();
  final password = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;


  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  /// Function to save user record
   Future<void> saveUserRecord(UserCredential userCredential)  async {

     try{
       // First update RX variable and then check if user data is already stored. if not then store
      await fetchUserDetails();
       if(user.value.id.isEmpty){
         // convert first name & lastname
         final nameParts = UserModel.nameParts(userCredential.user!.displayName);
         final username = '${userCredential.user!.displayName}23422';
         // create user model
         UserModel userModel = UserModel(
             id: userCredential.user!.uid,
             firstName: nameParts[0],
             lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : ' ' ,
             username: username,
             email: userCredential.user!.email ?? '',
             phoneNumber: userCredential.user!.phoneNumber ?? '',
             profilePicture: userCredential.user!.photoURL ?? '',
         );
         // save user record
         await _userRepository.saveUserRecord(userModel);

       }

     }catch(e){
       USnackBarHelpers.warningSnackBar(title: 'Data not save', message: 'Something went wrong while saving your data');
     }
   }

 /// Function to display user record
  Future<void> fetchUserDetails() async {
     try{
       profileLoading.value = true ;
       UserModel user = await _userRepository.fetchUserDetails();
       this.user(user);
     }catch(e){
       user(UserModel.empty());
     }
     finally{
       profileLoading.value = false;
     }
  }

  /// [popup] popup to delete account confirmation
   void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(USizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete account permanently?',
      confirm: ElevatedButton(
          onPressed: deleteUserAccount,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: USizes.lg),
            child: Text('Delete'),
          )) ,
      cancel: OutlinedButton(onPressed: () => Get.back(), child: Text('Cancel')));
   }
   /// Delete Account
   Future<void> deleteUserAccount() async {
    try{
      //  start loading 
      UFullScreenLoader.openLoadingDialog('processing...');
      // re authenticate
       final authRepository = AuthenticationRepository.instance;
       final provider = authRepository.currentUser!.providerData.map((e)=> e.providerId).first;
       // if google provider
       if(provider == 'google.com'){
         await authRepository.signInWithGoogle();
         await authRepository.deleteAccount();
         UFullScreenLoader.stopLoading();
         Get.offAll(LoginScreen());
         // if email or password provider
       }else if (provider == 'password'){
        UFullScreenLoader.stopLoading();
        Get.to(ReAuthenticateUserForm());

       }
    }catch(e){
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
   }

   /// Re- Authenticate - with email and password

   Future<void> reAuthenticateUser() async {
    try {
      //  start loading
      UFullScreenLoader.openLoadingDialog('processing...');
      // check internet
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }
      // Form validation
      if (!reAuthFormKey.currentState!.validate()){
      UFullScreenLoader.stopLoading();
      return;
    }
      // Re authenticate user with email and password
       await AuthenticationRepository.instance.reAuthenticateUserWithEmailAndPassword(email.text.trim(), password.text.trim());
      // Delete Account
       await AuthenticationRepository.instance.deleteAccount();
       // stop loading
      UFullScreenLoader.stopLoading();
      // redirect
      Get.offAll(LoginScreen());
    }catch(e){
      // stop loading
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    }
   }

   Future<void> updateUserProfilePicture() async {
    try{
     // Start loading
     isProfileUploading.value = true ;
    // pick image from gallery
      XFile? image = await  ImagePicker().pickImage(source: ImageSource.gallery, maxHeight: 512, maxWidth: 512);
      if(image == null) return;

    // Convert XFile to File
     File file = File(image.path);

     // delete user current profile picture
     if(user.value.publicId.isNotEmpty){
       await _userRepository.deleteProfilePicture(user.value.publicId);
     }
    // Upload Profile Picture to Cloudinary
    dio.Response response = await _userRepository.uploadImage(file);
    if(response.statusCode == 200){
      // Get Data
      final data = response.data;
      final imageUrl = data['url'];
      final publicId = data['public_id'];
      // update profile picture from fire store
      await _userRepository.updateSingleField({'profilePicture' : imageUrl, 'publicId' : publicId});

      // update profile picture and public Id from RX User
      user.value.profilePicture = imageUrl ;
      user.value.publicId = publicId ;
      user.refresh();
      
      USnackBarHelpers.successSnackBar(title: 'Congratulation', message: 'Profile Picture updated successfully');

    }else{
      throw 'Failed to upload profile picture. please try again';
    }
    }catch(e){
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
    }
    finally{
      isProfileUploading.value = false ;
    }
}
}