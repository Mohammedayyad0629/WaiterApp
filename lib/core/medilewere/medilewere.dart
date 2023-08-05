import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/nameroutes.dart';
import '../services/services.dart';

class MyMedileWere extends GetMiddleware {
  @override

  // ignore: overridden_fields
  int? priority = 1;

  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == "1") {
      return const RouteSettings(name: NameRoutes.login);
    }
    if (myServices.sharedPreferences.getString('step') == "2") {
      return const RouteSettings(name: NameRoutes.home);
    }
    return null;
  }
}
