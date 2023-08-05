import 'package:get/get_navigation/get_navigation.dart';
import 'package:waiter/view/screen/address/addaddressdetails.dart';
import 'package:waiter/view/screen/address/addressview.dart';
import 'package:waiter/view/screen/address/mapaddress.dart';
import 'package:waiter/view/screen/auth/forgetpassword.dart';
import 'package:waiter/view/screen/auth/login.dart';
import 'package:waiter/view/screen/auth/signup.dart';
import 'package:waiter/view/screen/cart/cart.dart';
import 'package:waiter/view/screen/categorymeals.dart';
import 'package:waiter/view/screen/favorite.dart';
import 'package:waiter/view/screen/homepage/home.dart';
import 'package:waiter/view/screen/order.dart';
import 'package:waiter/view/screen/orderdone.dart';
import 'package:waiter/view/screen/paymentorder.dart';
import 'package:waiter/view/screen/profile.dart';
import 'package:waiter/view/screen/restaurants/browsemorerestaurant.dart';
import 'package:waiter/view/screen/restaurants/choseaddress.dart';
import 'package:waiter/view/screen/restaurants/mealsrestaurant.dart';
import 'package:waiter/view/screen/restaurants/restaurants.dart';
import 'core/constant/nameroutes.dart';
import 'core/medilewere/medilewere.dart';
import 'view/screen/changepassword.dart';
import 'view/screen/editorder.dart';
import 'view/screen/restaurants/restaurantlocation.dart';
import 'view/screen/themeal/themeal.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: '/', page: () => const LogIn(), middlewares: [MyMedileWere()]),
  GetPage(name: NameRoutes.login, page: () => const LogIn()),
  GetPage(name: NameRoutes.home, page: () => const Home()),
  GetPage(name: NameRoutes.signup, page: () => const SignUp()),
  GetPage(name: NameRoutes.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: NameRoutes.restaurants, page: () => const Restaurants()),
  GetPage(
      name: NameRoutes.browserestaurant,
      page: () => const BrowseMoreRestaurant()),
  GetPage(
      name: NameRoutes.mealsrestaurants, page: () => const MealsRestaurant()),
  GetPage(name: NameRoutes.themeal, page: () => const TheMeal()),
  GetPage(name: NameRoutes.cart, page: () => Cart()),
  GetPage(name: NameRoutes.categorymeals, page: () => const CategoryMeals()),
  GetPage(name: NameRoutes.order, page: () => const Order()),
  GetPage(name: NameRoutes.editorder, page: () => const EditOrder()),
  GetPage(name: NameRoutes.orderdone, page: () => const OrderDone()),
  GetPage(name: NameRoutes.favorite, page: () => const Favorite()),
  GetPage(name: NameRoutes.changepassword, page: () => const ChangePassword()),
  GetPage(name: NameRoutes.profile, page: () => const Profile()),
  GetPage(name: NameRoutes.addaddress, page: () => const AddAddress()),
  GetPage(name: NameRoutes.viewaddress, page: () => const AddressView()),
  GetPage(name: NameRoutes.chooseaddress, page: () => const ChoseAddress()),
  GetPage(name: NameRoutes.paymentorder, page: () => const PaymentOrder()),

  GetPage(
      name: NameRoutes.addressdetails, page: () => const AddAddressDetails()),

  GetPage(
      name: NameRoutes.restaurantLocation,
      page: () => const RestaurantLocation()),

  // GetPage(name: NameRoutes.homescreen, page: () => const HomeScreen()),
  // GetPage(name: NameRoutes.homepage, page: () => HomePage()),
];
