
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController{

  static ChangeNameController get instance => Get.find();
  /// Variables
  final _userController = userController.instance;
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final updateUserFormKey = GlobalKey<FormState>();
  final _userRepository = UserRepository.instance;

  @override
  void onInit() {
    initializaNames();
    super.onInit();
  }
  void initializaNames(){
    firstName.text = _userController.user.value.firstName;
    lastName.text = _userController.user.value.lastName;
  }
  Future<void> updateUserName() async {
    try{
      
      // start loading
      UFullScreenLoader.openLoadingDialog('We are updaiting yor information');
      // check internet connectivity
     bool isConnected = await NetworkManager.instance.isConnected();
     if(!isConnected){
       UFullScreenLoader.stopLoading();
       return ;
     }
     // Form validation
      if(!updateUserFormKey.currentState!.validate()){
        UFullScreenLoader.stopLoading();
        return;
      }
      // update user name from firestore
      Map<String, dynamic> map =  {'firstName' : firstName.text, 'lastName' : lastName.text};
      await _userRepository.updateSingleField(map);
      // update user from Rx user
      _userController.user.value.firstName = firstName.text ;
      _userController.user.value.lastName = lastName.text ;

      // stop loading
      UFullScreenLoader.stopLoading();
      // Redirect
      Get.offAll(NavigationMenu());
      // success SnackBar
      USnackBarHelpers.successSnackBar(title: 'Congratulation', message: 'Your name has been updated ');
      
    }catch(e){
      // stop loading
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Update Name Failed', message: e.toString());
    }
  }
}