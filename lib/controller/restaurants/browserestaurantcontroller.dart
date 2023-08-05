import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/reomte/restaurantdata.dart';
import '../../data/modle/bestproductsrestaurantmodle.dart';
import '../../data/modle/categoriemodle.dart';
import '../../data/modle/mealsproductsrestaurantmodle.dart';

class BrowseRestaurantController extends GetxController {
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  Rx<AllCategriesModel> dataCategories = AllCategriesModel().obs;
  RestaurantData restaurandata = RestaurantData(Get.find());
  Rx<BestProductsRestaurantModle> bestproductsrestaurantModle =
      BestProductsRestaurantModle().obs;
  RxList<Data2> bestproductsrestaurantList = List<Data2>.empty().obs;
  Rx<MealsProductsRestaurantModle> mealsrestaurantModle =
      MealsProductsRestaurantModle().obs;
  RxList<Meals> mealsrestaurantrestaurantList = List<Meals>.empty().obs;
  int? idResturent;
  int? idCategories;
  String? nameCategory;

  bestproductsrestaurantData(String page, int idResturent) async {
    statusRequest = StatusRequest.loding;
    var response = await restaurandata.getbestproductsrestaurant(
        page, idResturent.toString());
    statusRequest = handlingData(response);
    print('statusRequest$statusRequest');
    if (StatusRequest.success == statusRequest) {
      print('ressd $response');
      if (response['status']) {
        bestproductsrestaurantModle.value =
            BestProductsRestaurantModle.fromJson(response);
        page == 0 ? bestproductsrestaurantList.clear() : print('');
        bestproductsrestaurantList
            .addAll(BestProductsRestaurantModle.fromJson(response).data!.data!);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getmealsrestaurantData(String page, int idResturent, int idCategory) async {
    statusRequest = StatusRequest.loding;
    mealsrestaurantrestaurantList.clear();
    var response = await restaurandata.mealsrestaurant(
        page, idResturent.toString(), idCategory.toString());
    statusRequest = handlingData(response);
    print('statusRequest$statusRequest');
    if (StatusRequest.success == statusRequest) {
      print('ressd $response');
      if (response['status']) {
        mealsrestaurantModle.value =
            MealsProductsRestaurantModle.fromJson(response);
        page == 0 ? mealsrestaurantrestaurantList.clear() : print('');
        mealsrestaurantrestaurantList.addAll(
            MealsProductsRestaurantModle.fromJson(response).data!.data!);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getDataCategorie(String idResturent) async {
    statusRequest = StatusRequest.loding;
    var response = await restaurandata.getDataCategories(idResturent);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print('ress $response');
      if (response['status']) {
        dataCategories.value = AllCategriesModel.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getNameCategory() {
    nameCategory = Get.arguments['nameCategory'];
    update();
  }

  @override
  void onInit() {
    idResturent = Get.arguments['idResturent'];
    nameCategory = Get.arguments['nameCategory'];
    idCategories = Get.arguments['idCategories'];

    print(idResturent);
    update();

    super.onInit();
  }
}
