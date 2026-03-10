import 'package:e_commerce/common/widgets/loaders/circular_loader.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/data/repositories/address/address_repository.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import '../models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final _repository = Get.put(AddressRepository());
  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  RxBool refreshData = false.obs;


  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final postalCode = TextEditingController();
  final country = TextEditingController();



  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
 /// Function to add new address
  Future<void> addNewAddress() async {
    try{
      UFullScreenLoader.openLoadingDialog('Storing address');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }
      // form validation
      if(!addressFormKey.currentState!.validate()){
        UFullScreenLoader.stopLoading();
        return;
      }
      // create address model
       AddressModel address = AddressModel(
         id:  '',
         name: name.text.trim(),
         phoneNumber: phoneNumber.text.trim(),
         postalCode: postalCode.text.trim(),
         street: street.text.trim(),
         city: city.text.trim(),
         state: state.text.trim(),
         country: country.text.trim(),
         dateTime: DateTime.now(),
       );
      // save address
     String addressId = await _repository.addAddress(address);
     // update addressId
     address.id = addressId;

     // update selected address
      selectedAddress(address);

     // stop loading
     UFullScreenLoader.stopLoading();
     // success snackbar
     USnackBarHelpers.successSnackBar(title: 'Congratulation', message: 'Your Address saves successfully');

     // refresh data
      refreshData.toggle();
     // clear text fields
      resetFormField();
      
      Navigator.pop(Get.context!);




    }catch(e){
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    }
  }
  /// Function to fetch user addresses
  Future<List<AddressModel>> getAllAddress() async {
    try{

    List<AddressModel> addresses = await  _repository.fetchUserAddresses();
    selectedAddress.value = addresses.firstWhere((addresses) => addresses.selectedAddress, orElse: () => AddressModel.empty());
    return addresses;
    }catch(e){
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
      return[];
    }
  }

  /// Function to select address
  Future<void> selectAddress(AddressModel newSelectedAddress) async {
    try{
      // start loading
      Get.defaultDialog(
        title: '',
        onWillPop: () async => false,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: UCircularLoader(),
      );
      if(selectedAddress.value.id.isNotEmpty){
        await _repository.updateSelectedField(selectedAddress.value.id, false);
      }
      // assign selected address
      newSelectedAddress.selectedAddress = true ;
      selectedAddress.value = newSelectedAddress;
      // set new selected address to firebase
      await _repository.updateSelectedField(selectedAddress.value.id, true);
      Get.back();
    }catch(e){
      Get.back();
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
    }
  }



  void resetFormField(){
    name.clear();
    postalCode.clear();
    phoneNumber.clear();
    state.clear();
    city.clear();
    country.clear();
    street.clear();
    addressFormKey.currentState!.reset();
  }
}