class ApiLink {
  static const String server = "http://matam.rushshow.net/api";

  //======================Auth====================================//
  static const String signup = "$server/user/register";
  static const String login = "$server/user/login";
  // static const String verificationCodeSignup = "$server/auth/verfiycode.php";
  // static const String resendcode = "$server/auth/resendcode.php";
  static const String profile = "$server/user/current_user";
  static const String updateprofile = "$server/user/update_profile";
  static const String changephoto = "$server/user/set_photo";
  static const String changepassword = "$server/user/update_password";
  //======================ForgetPassword====================================//
  static const String checkemail = "$server/user/forget_password";
  static const String verifycodeforget = "$server/user/get_otp";
  static const String resetpassword = "$server/user/reset_password";
  //======================Home====================================//
  static const String home = "$server/home.php";
  static const String homeCategories = "$server/user/get_categories";
  static const String homeCategoriesRestaurants =
      "$server/user/get_categories_restaurants";
  static const String homeBestProducts = "$server/user/best_products/";
  static const String homeOfferProducts = "$server/user/offer_products";
  static const String homeAllRestaurants = "$server/user/get_all_restaurants";
  //======================Restaurant====================================//
  static const String getRestaurant = "$server/user/restaurant_profile";
  static const String offerproductsrestaurant =
      "$server/user/offer_products_restaurant/";
  static const String bestProdctRestaurant =
      "$server/user/best_seller_products_restaurant/";
  static const String mealsRestaurant =
      "$server/user/get_meals_by_category_id_and_restaurant_id/";
  static const String theMeal = "$server/user/store/product_by_id/";

  //======================My Cart====================================//
  static const String viweCart = "$server/user/store/get_my_cart";
  static const String addCart = "$server/user/store/add_to_cart/";
  static const String deleteCart = "$server/user/store/delete_from_cart/";
  //===========================Category===============================//
  static const String category = "$server/user/get_meals_by_category_id/";

  //======================Search====================================//
  static const String search = "$server/items/search.php";
  //======================Favorite====================================//
  static const String favoriteAddOrRemove =
      "$server/user/add_or_remove_from_wishlists/";
  static const String favorite = "$server/user/get_my_wishlists";

  //======================Address====================================//
  static const String addressView = "$server/user/address/get_my_address";
  static const String addaddress = "$server/user/address/add_address";
  static const String addressDelete = "$server/user/address/delete_address/";
  static const String addressEdit = "$server/address/edit.php";
}
