import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/reomte/password/changepassworddata.dart';

class ChangePasswordController extends GetxController {
  MyServices myServices = Get.find();
  PasswordData passwordData = PasswordData(Get.find());
  late StatusRequest statusRequest;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController againnewpassword;
  late TextEditingController oldpassword;
  bool isshowpassword = true;
  Color passwordicon = AppColor.iconcolor;
  bool isshowpassword2 = true;
  Color passwordicon2 = AppColor.iconcolor;
  bool isshowpassword3 = true;
  Color passwordicon3 = AppColor.iconcolor;

  getChangePassword() async {
    if (password.text != againnewpassword.text) {
      Get.defaultDialog(title: "warning", middleText: "Password Not Match");
    } else if (key.currentState!.validate()) {
      statusRequest = StatusRequest.loding;
      var response = await passwordData.changepasswordData(oldpassword.text,
          password.text, myServices.sharedPreferences.getString('token')!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print('ress $response');
        if (response['status'] == true) {
          Get.snackbar('ُSuccess', response['message_en']);
          Get.offAllNamed(NameRoutes.home);
          // profileModle.value = ProfileModle.fromJson(response);
        } else {
          Get.snackbar('ُSuccess', response['message_en']);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  isshow() {
    if (isshowpassword == true) {
      isshowpassword = false;
      passwordicon = AppColor.maincolor;
      update();
    } else {
      isshowpassword = true;
      passwordicon = AppColor.iconcolor;
      update();
    }
  }

  isshow2() {
    if (isshowpassword2 == true) {
      isshowpassword2 = false;
      passwordicon2 = AppColor.maincolor;
      update();
    } else {
      isshowpassword2 = true;
      passwordicon2 = AppColor.iconcolor;
      update();
    }
  }

  isshow3() {
    if (isshowpassword3 == true) {
      isshowpassword3 = false;
      passwordicon3 = AppColor.maincolor;
      update();
    } else {
      isshowpassword3 = true;
      passwordicon3 = AppColor.iconcolor;
      update();
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    oldpassword = TextEditingController();
    againnewpassword = TextEditingController();

    super.onInit();
  }
}
