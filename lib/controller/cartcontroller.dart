import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/reomte/cartdata.dart';
import '../data/modle/cartmodle.dart';

class CartController extends GetxController {
  late StatusRequest statusRequest;
  CartData cartData = CartData(Get.find());
  Rx<MyCartModle> cartModle = MyCartModle().obs;
  MyServices myServices = Get.find();
  int? click;
  int quantity = 1;
  List<int> select = [0, 1, 2];
  RxDouble totalPrice = (0.0).obs;
  int selectedOption = 0;
  getMyCart() async {
    statusRequest = StatusRequest.loding;
    var response = await cartData
        .getMyCartData(myServices.sharedPreferences.getString('token')!);
    statusRequest = handlingData(response);
    print('ress $response');
    if (StatusRequest.success == statusRequest) {
      if (response['status']) {
        cartModle.value = MyCartModle.fromJson(response);
        totalPrice.value = 0.0;
        for (var i = 0; i < cartModle.value.data!.length; i++) {
          totalPrice.value +=
              double.parse(cartModle.value.data![i].total.toString());
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addMyCart(String idMeal, String quantity) async {
    statusRequest = StatusRequest.loding;
    var response = await cartData.addCart(
        idMeal, quantity, myServices.sharedPreferences.getString('token')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status']) {
        getMyCart();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteMyCart(String idMeal) async {
    statusRequest = StatusRequest.loding;
    var response = await cartData.deleteCart(
        idMeal, myServices.sharedPreferences.getString('token')!);
    statusRequest = handlingData(response);
    print('ress $response');
    if (StatusRequest.success == statusRequest) {
      if (response['status']) {
        getMyCart();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addQuantity(int index, String idMeal) {
    quantity = int.parse(cartModle.value.data![index].quantity!);
    quantity++;
    addMyCart(idMeal, quantity.toString());
    update();
  }

  removeQuantity(int index, String idMeal) {
    if (quantity > 1) {
      quantity = int.parse(cartModle.value.data![index].quantity!);
      quantity--;
      addMyCart(idMeal, quantity.toString());
    }
    update();
  }

  onChang(value) {
    click = value;
    print(click);
    print(selectedOption);
    update();
  }

  @override
  void onInit() {
    getMyCart();

    super.onInit();
  }
}
