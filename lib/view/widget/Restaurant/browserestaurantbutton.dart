import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/restaurants/browserestaurantcontroller.dart';
import '../../../controller/restaurants/restaurantscontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/nameroutes.dart';

class BrowseRestaurantButton extends GetView<RestaurantsController> {
  const BrowseRestaurantButton({super.key});

  @override
  Widget build(BuildContext context) {
    BrowseRestaurantController browseRestaurantController =
        Get.put(BrowseRestaurantController());
    return Positioned(
      bottom: 10.h,
      child: SizedBox(
          width: Get.width,
          child: Obx(
            () => controller.dataCategories.value.status == null
                ? const Center(child: CircularProgressIndicator())
                : Center(
                    child: controller.dataCategories.value.data!.isNotEmpty
                        ? InkWell(
                            onTap: () {
                              browseRestaurantController
                                  .bestproductsrestaurantData(
                                      '1',
                                      controller
                                          .restaurantModle.value.data!.id!);

                              Get.toNamed(NameRoutes.browserestaurant,
                                  arguments: {
                                    'idResturent': controller
                                        .restaurantModle.value.data!.id!,
                                    'nameResturent': controller
                                        .restaurantModle.value.data!.name
                                  });
                              browseRestaurantController.getDataCategorie(
                                  controller.idRestaurant.toString());
                            },
                            child: Container(
                              width: 300.w,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(20.r),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.maincolor, width: 2.w),
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(12.r)),
                              child: Text(
                                'Browse more',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.maincolor, fontSize: 16.sp),
                              ),
                            ),
                          )
                        : Container()),
          )),
    );
  }
}
