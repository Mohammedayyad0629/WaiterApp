import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/reomte/password/checkemail.dart';

class ForgetPasswordController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;
  CheckEmail checkEmail = CheckEmail(Get.find());

  forgetpassword() async {
    var formdata = key.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.none;
      update();
      var response = await checkEmail.checkData(
        email.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.toNamed(NameRoutes.verificationcode,
              arguments: {'email': email.text});
        } else {
          Get.defaultDialog(
              title: "Error", middleText: 'Email does not exist before');
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
