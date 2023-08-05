import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/reomte/addressdata.dart';
import '../../data/modle/addressmodle.dart';

class AddressViewController extends GetxController {
  late StatusRequest statusRequest;
  AddressData addressData = AddressData(Get.find());
  Rx<AddressModle> addressModle = AddressModle().obs;
  MyServices myServices = Get.find();
  late double lat_res;
  late double long_res;

  getMyAddress() async {
    statusRequest = StatusRequest.loding;
    var response = await addressData
        .addressviwe(myServices.sharedPreferences.getString('token')!);
    statusRequest = handlingData(response);
    print('ress $response');
    if (StatusRequest.success == statusRequest) {
      if (response['status']) {
        addressModle.value = AddressModle.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteAddress(String idAddress) async {
    statusRequest = StatusRequest.loding;
    var response = await addressData.deleteaddress(
        idAddress, myServices.sharedPreferences.getString('token')!);
    statusRequest = handlingData(response);
    print('ress $response');
    if (StatusRequest.success == statusRequest) {
      if (response['status']) {
        getMyAddress();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getMyAddress();
    super.onInit();
  }
}
