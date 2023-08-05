import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/restaurants/restaurantscontroller.dart';

class RestaurantImage extends GetView<RestaurantsController> {
  const RestaurantImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: controller.restaurantModle.value.data!.photo!,
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.cover,
      height: Get.height / 2.h,
    );
  }
}
