import 'dart:developer';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/reomte/favorite/favoritedata.dart';
import '../../data/modle/favoritemodle.dart';

class FavoriteController extends GetxController {
  late StatusRequest statusRequest;
  FavoriteData favoriteData = FavoriteData(Get.find());
  Rx<FavoriteModle> favoriteModle = FavoriteModle().obs;
  MyServices myServices = Get.find();

  getFavorite() async {
    statusRequest = StatusRequest.loding;
    var response = await favoriteData
        .getFavoriteData(myServices.sharedPreferences.getString('token')!);
    statusRequest = handlingData(response);
    log('ress $response');
    if (StatusRequest.success == statusRequest) {
      if (response['status']) {
        favoriteModle.value = FavoriteModle.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addFavoriteOrRemove(String idMeal) async {
    statusRequest = StatusRequest.loding;
    var response = await favoriteData.favoriteAddOrRemove(
        idMeal, myServices.sharedPreferences.getString('token')!);
    statusRequest = handlingData(response);
    log('ress $statusRequest');
    log('ress $response');

    if (StatusRequest.success == statusRequest) {
      if (response['status']) {
        getFavorite();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
