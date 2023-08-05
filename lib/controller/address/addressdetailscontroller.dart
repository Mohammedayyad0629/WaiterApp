import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/reomte/addressdata.dart';

class AddressDetailsController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController address;
  late TextEditingController mobile;
  late double latitude;
  late double longitude;
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  addAddress() async {
    var formdata = key.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loding;
      var response = await addressData.postData(
          name.text,
          address.text,
          mobile.text,
          latitude,
          longitude,
          myServices.sharedPreferences.getString('token')!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print(response);
        if (response['status']) {
          Get.offNamed(
            NameRoutes.viewaddress,
          );
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    address = TextEditingController();
    mobile = TextEditingController();
    latitude = Get.arguments['lat'];
    longitude = Get.arguments['long'];
    super.onInit();
  }
}
