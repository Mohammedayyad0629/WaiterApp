import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/reomte/restaurantdata.dart';
import '../../data/modle/categoriemodle.dart';
import '../../data/modle/offerproductsrestaurantmodle.dart';
import '../../data/modle/restaurantmodle.dart';

class RestaurantsController extends GetxController {
  RestaurantData restaurandata = RestaurantData(Get.find());
  Rx<RestaurantModle> restaurantModle = RestaurantModle().obs;
  Rx<OfferProductsRestaurantModle> offerProductsrestaurantModle =
      OfferProductsRestaurantModle().obs;
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  Rx<AllCategriesModel> dataCategories = AllCategriesModel().obs;
  late int idRestaurant;
  late String nameResturent;

  int length = 0;

  restaurantData() async {
    statusRequest = StatusRequest.loding;

    var response =
        await restaurandata.getRestaurantdata(idRestaurant.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print('ress $response');
      if (response['status']) {
        restaurantModle.value = RestaurantModle.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  offerproductsrestaurantData() async {
    statusRequest = StatusRequest.loding;
    var response =
        await restaurandata.getofferproductsrestaurant(idRestaurant.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print('ress $response');
      if (response['status']) {
        offerProductsrestaurantModle.value =
            OfferProductsRestaurantModle.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getDataCategorie() async {
    statusRequest = StatusRequest.loding;
    var response =
        await restaurandata.getDataCategories(idRestaurant.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status']) {
        dataCategories.value = AllCategriesModel.fromJson(response);
        length = dataCategories.value.data!.length;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // getidResturent(int idResturen) {
  //   idResturent = idResturen;

  //   update();
  // }

  initialData() async {}

  @override
  void onInit() {
    idRestaurant = Get.arguments['idRestaurant'];
    nameResturent = Get.arguments['nameResturent'];
    restaurantData();
    offerproductsrestaurantData();
    getDataCategorie();
    super.onInit();
  }
}
