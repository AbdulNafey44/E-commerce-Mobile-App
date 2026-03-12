
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/features/shop/controller/product/variation_controller.dart';
import 'package:e_commerce/features/shop/models/cart_item_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/models/product_variation_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/constants/enum.dart';
import '../../../../utils/constants/keys.dart';

class CartController extends GetxController{
  static CartController get instance => Get.find();

  /// variables
  final _storage = GetStorage(AuthenticationRepository.instance.currentUser!.uid);
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  final variationController = VariationController.instance;


  CartController(){
    loadCartItem();
  }
  /// load  all cartItem from local storage
  void loadCartItem(){
   List<dynamic>? storedCartItems =  _storage.read(UKeys.cartItemsKey);
   if(storedCartItems != null){
     cartItems.assignAll(storedCartItems.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
     updateCartTotals();
   }
  }

  /// Add Items in the Cart
  void addToCart(ProductModel product) {

    // check quantity in cart
    if(productQuantityInCart < 1) {
      USnackBarHelpers.customToast(message: 'Select Quantity');
      return ;
    }
    // check variation of product if it is variable product
    if(product.productType == ProductType.variable.toString() && variationController.selectedVariation.value.id.isEmpty ){
      USnackBarHelpers.customToast(message: 'Select Variation');
        return;
    }
    // out of stock status
    if(product.productType == ProductType.variable.toString()){
      if(variationController.selectedVariation.value.stock < 1){
        USnackBarHelpers.warningSnackBar(title: 'Out of stock', message: 'This variation is out of stock');
        return;
      }
    }else{
      if(product.stock < 1){
        USnackBarHelpers.warningSnackBar(title: 'Out of stock', message: 'This product is out of stock');
      }
    }
    // convert product model to CartItemModel with given quantity
     CartItemModel selectedCartItem =  convertToCartItem(product, productQuantityInCart.value);

    // check if already added in the cart
    int index = cartItems.indexWhere((cartItem) =>  cartItem.productId == selectedCartItem.productId && selectedCartItem.variationId == cartItem.variationId);
    if(index >= 0){
      // this quantity is already added or update/removed from the cart
      cartItems[index].quantity = selectedCartItem.quantity;
    }else{
      cartItems.add(selectedCartItem);
    }
    // update cart
    updateCart();
    USnackBarHelpers.customToast(message: 'Your product has been added to the cart');
  }
  /// Add one item to cart
  void addOneToCart(CartItemModel item){
    int index = cartItems.indexWhere((cartItem) => item.productId == cartItem.productId && item.variationId == cartItem.variationId);

    if(index >= 0){
      cartItems[index].quantity += 1;
    }else{
      cartItems.add(item);
    }
    updateCart();
  }
  /// Remove one item from cart
  void removeOneFromCart(CartItemModel item){
    int index = cartItems.indexWhere((cartItem) => item.productId == cartItem.productId && item.variationId == cartItem.variationId);
    if(index >= 0){
      if(cartItems[index].quantity > 1){
        cartItems[index].quantity -= 1;
      }else{
        cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }
    }
    updateCart();
  }
  /// Remove From Cart
 void removeFromCartDialog(int index){
   Get.defaultDialog(
     title: 'Remove Product',
     middleText: 'Are you sure you want to remove this product?',
     onConfirm: () {
     cartItems.removeAt(index);
     updateCart();
     USnackBarHelpers.customToast(message: 'Product remove from the cart');
     Get.back();
     },
     onCancel: () {}
   );
  }
  /// Get total quantity of same specific product
  int getProductQuantityInCart(String productId){
    final itemQuantity = cartItems.where((cartItem) => cartItem.productId == productId).fold(
        0, (previousValue, cartItem) => previousValue + cartItem.quantity );
    return itemQuantity;
  }
  /// Get variation quantity in cart
   int getVariationQuantityInCart(String productId, String variationId){
    CartItemModel cartItemModel = cartItems.firstWhere((item) => item.productId == productId && item.variationId == variationId,
    orElse: () => CartItemModel.empty()
    );
    return cartItemModel.quantity;
   }
  /// update cart
  void updateCart(){
    // update
    updateCartTotals();
    // save cart
    saveCartItems();
    cartItems.refresh();
  }
  /// save cartItems into local storage
  void  saveCartItems(){
    List<Map<String, dynamic>> cartItemList = cartItems.map((item) => item.toJson()).toList();
    _storage.write(UKeys.cartItemsKey, cartItemList);
  }
 /// update total price & no of items of cart
  void updateCartTotals(){
    double calculateTotalPrice = 0.0;
    int calculateNoOfItems = 0;
    for(final item in cartItems){
      calculateTotalPrice += (item.price) * item.quantity.toDouble();
      calculateNoOfItems += item.quantity;
    }
    totalCartPrice.value = calculateTotalPrice;
    noOfCartItems.value = calculateNoOfItems;
  }
  /// convert product model to cart model
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if(product.productType == ProductType.single.toString()){
      // reset variation in case of single product type
      variationController.resetSelectedAttributes();
    }


    ProductVariationModel variation = variationController.selectedVariation
        .value;
    bool isVariation = variation.id.isNotEmpty;
    String image = isVariation ? variation.image : product.thumbnail;
    double price = isVariation ? variation.salePrice > 0.0 ? variation.salePrice : variation.price :
        product.salePrice > 0.0 ? product.salePrice : product.price;
    
     return CartItemModel(
         productId: product.id,
         quantity: quantity,
         title: product.title,
          brandName: product.brand != null ? product.brand!.name : '' ,
          image: image,
          price: price,
          selectedVariation: isVariation ? variation.attributeValues : null ,
       variationId: variation.id
             );
  }

  /// Initialize already added items count in the cart
  void updateAlreadyAddedProductCount(ProductModel product){
    if(product.productType == ProductType.single.toString()){
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    }else{
      String variationId = variationController.selectedVariation.value.id;
      if(variationId.isNotEmpty){
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      }else{
        productQuantityInCart.value = 0;
      }
    }
  }
 /// clear the cart
  void clearCart(){
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}