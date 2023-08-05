import 'package:get/get.dart';
import 'package:waiter/data/datasource/reomte/themealdata.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/modle/themealmodle.dart';

class TheMealController extends GetxController {
  late StatusRequest statusRequest;
  int quantity = 1;
  double totalPrice = 0.0;
  TheMealData theMealData = TheMealData(Get.find());
  Rx<TheMealModle> theMealModle = TheMealModle().obs;

  getTheMeal(String idMeal) async {
    print(idMeal);
    statusRequest = StatusRequest.loding;
    var response = await theMealData.getMealdata(idMeal);
    statusRequest = handlingData(response);
    print('ress $response');
    if (StatusRequest.success == statusRequest) {
      if (response['status']) {
        theMealModle.value = TheMealModle.fromJson(response);
        price();
        quantity = 1;
        Get.toNamed(
          NameRoutes.themeal,
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addQuantity() {
    quantity++;
    price();
    update();
  }

  removeQuantity() {
    if (quantity > 1) {
      quantity--;
    }
    price();
    update();
  }

  price() {
    totalPrice = double.tryParse(theMealModle.value.data!.price!)! * quantity;
  }
}
