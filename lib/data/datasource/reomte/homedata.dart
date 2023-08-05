import 'dart:io';

import 'package:waiter/linkapi.dart';

import '../../../core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getDataCategories() async {
    var response = await crud.getData(ApiLink.homeCategories);
    return response.fold((l) => l, (r) => r);
  }

  getProfileData(String token) async {
    var response = await crud.getHeadData(ApiLink.profile, token);
    return response.fold((l) => l, (r) => r);
  }

  getUpdateProfileData(
    String email,
    String name,
    String mobile,
    String token,
  ) async {
    var response = await crud.postheadData(
        ApiLink.updateprofile,
        {
          "email": email,
          "name": name,
          'mobile': mobile,
        },
        token);
    return response.fold((l) => l, (r) => r);
  }

  getChangePhotoData(
    File image,
    String token,
  ) async {
    var response = await crud.postheadData(
        ApiLink.changephoto,
        {
          "photo": image,
        },
        token);
    return response.fold((l) => l, (r) => r);
  }

  getDataCategoriesRestaurants() async {
    var response = await crud.getData(
      ApiLink.homeCategoriesRestaurants,
    );
    return response.fold((l) => l, (r) => r);
  }

  getBestProducts() async {
    var response = await crud.getData(
      ApiLink.homeBestProducts,
    );
    return response.fold((l) => l, (r) => r);
  }

  getOfferProducts() async {
    var response = await crud.getData(
      ApiLink.homeOfferProducts,
    );
    return response.fold((l) => l, (r) => r);
  }

  getAllRestaurants() async {
    var response = await crud.getData(
      ApiLink.homeAllRestaurants,
    );
    return response.fold((l) => l, (r) => r);
  }
}
