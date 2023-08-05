import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:waiter/core/constant/color.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/reomte/auth/logindata.dart';

class LogInController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  double latitude = 0.0;
  double longitude = 0.0;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  bool isshowpassword = true;
  Color passwordicon = AppColor.iconcolor;
  IconData eyeicon = Icons.visibility_off_outlined;
  bool isremember = false;
  // late bool isrememberme;
  String fcm_token = "";

  isshow() {
    if (isshowpassword == true) {
      isshowpassword = false;
      eyeicon = Icons.visibility_outlined;
      passwordicon = AppColor.maincolor;
      update();
    } else {
      isshowpassword = true;
      passwordicon = AppColor.iconcolor;
      eyeicon = Icons.visibility_off_outlined;
      update();
    }
  }

  rememberMe(bool isrememberme) {
    isremember = isrememberme;
    update();
  }

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    latitude = position.latitude;
    longitude = position.longitude;
    update();
  }

  login() async {
    var formdata = key.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loding;
      update();
      var response =
          await loginData.postData(email.text, password.text, fcm_token);
      statusRequest = handlingData(response);
      log("token: " '$fcm_token');
      if (StatusRequest.success == statusRequest) {
        print(response);
        if (response['status']) {
          myServices.sharedPreferences.setString("step", "2");
          myServices.sharedPreferences
              .setString("token", response['accessToken']);
          myServices.sharedPreferences.setDouble("lat", latitude);
          myServices.sharedPreferences.setDouble("long", longitude);

          Get.offNamed(
            NameRoutes.home,
          );
        }
      } else {
        Get.defaultDialog(
            title: "تحذير", middleText: 'الايميل غير موجود سابقا');
        statusRequest = StatusRequest.failure;
      }
      update();
    } else {}
  }

  forgetpassword() {
    Get.toNamed(NameRoutes.forgetpassword);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((token) {
      fcm_token = token!;
    });
    getCurrentLocation();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
