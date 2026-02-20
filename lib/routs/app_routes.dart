


import 'package:e_commerce/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce/features/shop/screens/store/store.dart';
import 'package:e_commerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/routs/routes.dart';
import 'package:get/get.dart';


import '../common/widgets/screens/verify_screen.dart';
import '../features/authentication/screens/forgetpassword/forget_password.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/signup/signup.dart';

import '../features/personalization/screens/addresses/address.dart';
import '../features/personalization/screens/edit_profile_screen/edit_profile.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/orders/order.dart';

class UAppRoutes{

  static final screens = [
    GetPage(name: URoutes.store, page: () => const NavigationMenu(),),
    GetPage(name: URoutes.store, page: () => const StoreScreen(),),
    GetPage(name: URoutes.wishlist, page: () => const WishlistScreen(),),
    GetPage(name: URoutes.profile, page: () => const ProfileScreen(),),
    GetPage(name: URoutes.order, page: () => const OrderScreen(),),
    GetPage(name: URoutes.checkout, page: () => const CheckOutScreen(),),
    GetPage(name: URoutes.cart, page: () => const CartScreen(),),
    GetPage(name: URoutes.editProfile, page: () => const EditProfileScreen(),),
    GetPage(name: URoutes.userAddress, page: () => const AddressScreen(),),
    GetPage(name: URoutes.signup, page: () => const SignupScreen(),),
    GetPage(name: URoutes.verifyEmail, page: () => const VerifyScreen(),),
    GetPage(name: URoutes.signIn, page: () => const LoginScreen(),),
    GetPage(name: URoutes.forgetPassword, page: () => const ForgetPassword(),),
    GetPage(name: URoutes.onBoarding, page: () => const Onboarding(),),
  ];
}