import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/restaurants/restaurantscontroller.dart';
import '../../widget/Restaurant/browserestaurantbutton.dart';
import '../../widget/Restaurant/detilesrestaurant.dart';
import '../../widget/Restaurant/restaurantimage.dart';

class Restaurants extends StatelessWidget {
  const Restaurants({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RestaurantsController());

    return Scaffold(
      body: GetBuilder<RestaurantsController>(builder: (controller) {
        return Obx(() => Container(
            padding: EdgeInsets.only(
              top: 20.h,
            ),
            color: Colors.white,
            width: double.infinity,
            child: controller.restaurantModle.value.status == null
                ? const Center(child: CircularProgressIndicator())
                : controller.restaurantModle.value.data == 0
                    ? const Text('No find data')
                    : const Stack(
                        children: [
                          RestaurantImage(),
                          DetilesRestaurant(),
                          BrowseRestaurantButton()
                        ],
                      )));
      }),
    );
  }
}
