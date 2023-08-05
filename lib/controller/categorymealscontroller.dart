import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/reomte/categorydata.dart';
import '../data/modle/categorymealsmodle.dart';

class CategoryMealsController extends GetxController {
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  String? nameCategory;
  CategoryData categoryData = CategoryData(Get.find());
  Rx<CategoryMealsModle> categoryMealsModle = CategoryMealsModle().obs;

  getcategoryMealsData(String idCategory) async {
    statusRequest = StatusRequest.loding;
    var response = await categoryData.categoryMealsdata(idCategory.toString(),
        myServices.sharedPreferences.getString('token')!);
    print('ressd $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status']) {
        categoryMealsModle.value = CategoryMealsModle.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getNameCategory(String nameCategor) {
    nameCategory = nameCategor;
    update();
  }
}
