import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/restaurants/restaurantscontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/nameroutes.dart';
import '../iconsgradient.dart';
import 'obxofferrestaurant.dart';

class DetilesRestaurant extends GetView<RestaurantsController> {
  const DetilesRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        children: [
          SizedBox(
            height: Get.height / 2.2.h,
          ),
          Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
              // height: Get.height,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: AppColor.maincolor.withOpacity(0.3),
                      spreadRadius: 0.1,
                      blurRadius: 30,
                      offset: const Offset(0, 0)),
                ],
                // border: Border.all(
                //     color: AppColor.maincolor
                //         .withOpacity(0.2),
                //     width: 3),
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(42.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Column(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.restaurantModle.value.data!.name!,
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                Get.toNamed(NameRoutes.chooseaddress,
                                    arguments: {
                                      'lat_res': controller
                                          .restaurantModle.value.data!.latitude,
                                      'long_res': controller
                                          .restaurantModle.value.data!.longitude
                                    });
                              },
                              icon: const Icon(
                                Icons.arrow_circle_right,
                                color: AppColor.maincolor,
                              ))
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text('${controller.restaurantModle.value.data!.rate}'),
                      Text(
                          '(Ratings ${controller.restaurantModle.value.data!.rateCount!})'),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const GradientColor(
                                child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                            )),
                            controller.restaurantModle.value.data!.address ==
                                    null
                                ? Text(
                                    'There is no location',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColor.textcolor),
                                  )
                                : Text(controller
                                    .restaurantModle.value.data!.address!),
                          ],
                        ),
                        controller.restaurantModle.value.data!.statusOpen! > 0
                            ? Row(
                                children: [
                                  const GradientColor(
                                      child: Icon(
                                    Icons.verified,
                                    color: Colors.white,
                                  )),
                                  Text(
                                    'Opne',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColor.textcolor),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  const Icon(
                                    Icons.new_releases,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    'Close',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColor.textcolor),
                                  )
                                ],
                              )
                      ]),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    controller.restaurantModle.value.data!.description!,
                    style:
                        TextStyle(fontSize: 14.sp, color: AppColor.textcolor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const ObxOfferRestaurant(),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
