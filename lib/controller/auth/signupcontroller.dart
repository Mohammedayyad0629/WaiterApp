import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/reomte/auth/signupdata.dart';

class SignUpController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController name;
  late TextEditingController mobile;
  late TextEditingController againnewpassword;
  String latitude = '';
  String longitude = '';
  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());

  List data = [];
  bool isshowpassword = true;
  Color passwordicon = AppColor.iconcolor;
  IconData eyeicon = Icons.visibility_off_outlined;
  bool isshowpassword2 = true;
  Color passwordicon2 = AppColor.iconcolor;
  IconData eyeicon2 = Icons.visibility_off_outlined;
  // ignore: non_constant_identifier_names
  String fcm_token = "";
  // late bool isrememberme;

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    latitude = position.latitude.toString();
    longitude = position.longitude.toString();
    update();
  }

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

  isshow2() {
    if (isshowpassword2 == true) {
      isshowpassword2 = false;
      eyeicon2 = Icons.visibility_outlined;
      passwordicon2 = AppColor.maincolor;
      update();
    } else {
      isshowpassword2 = true;
      passwordicon2 = AppColor.iconcolor;
      eyeicon2 = Icons.visibility_off_outlined;
      update();
    }
  }

  signup() async {
    var formdata = key.currentState;
    if (password.text != againnewpassword.text) {
      Get.defaultDialog(title: "warning", middleText: "Password Not Match");
    } else if (formdata!.validate()) {
      statusRequest = StatusRequest.loding;
      update();
      var response = await signupData.postData(email.text, password.text,
          name.text, mobile.text, fcm_token, latitude, longitude);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print(response);
        if (response['status']) {
          // data.addAll(response[data]);
          goto();
          // Get.offNamed(NameRoutes.verificationsignup,
          //     arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "تحذير", middleText: 'الايميل موجود سابقا');
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    mobile = TextEditingController();
    againnewpassword = TextEditingController();
    FirebaseMessaging.instance.getToken().then((token) {
      fcm_token = token!;
    });
    getCurrentLocation();
    super.onInit();
  }

  goto() {
    Get.toNamed(NameRoutes.home, arguments: {
      'lat': latitude,
      'long': longitude,
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
