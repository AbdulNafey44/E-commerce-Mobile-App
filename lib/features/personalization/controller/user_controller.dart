import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class userController extends GetxController{

  static userController get instance => Get.find();

  /// Variables
 final _userRepository = Get.put(UserRepository());
 Rx<UserModel> user = UserModel.empty().obs;
 RxBool profileLoading = false.obs;


  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  /// Function to save user record
   Future<void> saveUserRecord(UserCredential userCredential)  async {

     try{
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
           profilePicture: userCredential.user!.photoURL ?? '');
       // save user record
      await _userRepository.saveUserRecord(userModel);

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
}