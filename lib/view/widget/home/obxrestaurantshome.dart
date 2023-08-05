import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/home/homepagecontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/nameroutes.dart';

class ObxRestaurantsHome extends GetView<HomepageController> {
  const ObxRestaurantsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Restaurants:',
                style: GoogleFonts.cairo(
                  fontSize: 18.0.sp,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w700,
                  height: 1.44.h,
                ),
              ),
              InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'All Restaurants',
                        style: GoogleFonts.cairo(
                          fontSize: 12.0.sp,
                          color: const Color(0xFF333333),
                          fontWeight: FontWeight.w600,
                          height: 1.83.h,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const Icon(
                        Icons.arrow_circle_right,
                        color: AppColor.maincolor,
                      )
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 165.h,
            width: double.infinity,
            child: controller.dataAllRestaurants.value.status == null
                ? const Center(child: CircularProgressIndicator())
                : controller.dataAllRestaurants.value.data!.isEmpty
                    ? const Text('No find data')
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            controller.dataAllRestaurants.value.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(NameRoutes.restaurants, arguments: {
                                'idRestaurant': controller
                                    .dataAllRestaurants.value.data![index].id,
                                'nameResturent': controller
                                    .dataAllRestaurants.value.data![index].name
                              });
                              log(controller
                                  .dataAllRestaurants.value.data![index].id
                                  .toString());
                            },
                            child: Container(
                              // width: 150,
                              // // padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: AppColor.maincoloroff.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: CachedNetworkImage(
                                          imageUrl: controller
                                              .dataAllRestaurants
                                              .value
                                              .data![index]
                                              .photo!,
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          fit: BoxFit.cover,
                                          width: 180.w,
                                          height: 120.h,
                                        ),
                                      ),
                                      Positioned(
                                          top: 5.h,
                                          right: 10.w,
                                          child: controller
                                                      .dataAllRestaurants
                                                      .value
                                                      .data![index]
                                                      .rate ==
                                                  '0'
                                              ? Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 3.h,
                                                      horizontal: 3.w),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.r)),
                                                  child:
                                                      //  Text('${controller.dataBestProducts.value.data![index].offerValue}'),
                                                      Center(
                                                          child: Row(
                                                    children: [
                                                      Icon(Icons.star_half,
                                                          size: 15.r,
                                                          color: Colors.yellow),
                                                      const Text(
                                                        '4.5',
                                                        style: TextStyle(),
                                                      )
                                                    ],
                                                  )),
                                                )
                                              : Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 3.h,
                                                      horizontal: 3.w),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.r)),
                                                  child:
                                                      //  Text('${controller.dataBestProducts.value.data![index].offerValue}'),
                                                      Center(
                                                          child: Row(
                                                    children: [
                                                      Icon(
                                                          Icons
                                                              .star_outline_outlined,
                                                          size: 15.r,
                                                          color: Colors.yellow),
                                                      const Text(
                                                        '0',
                                                        style: TextStyle(),
                                                      )
                                                    ],
                                                  )),
                                                )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SizedBox(
                                    width: 180.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          width: 150.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                child: Text(
                                                    "${controller.dataAllRestaurants.value.data![index].name}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Text(
                                                "${controller.dataAllRestaurants.value.data![index].description}",
                                                overflow: TextOverflow.visible,
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(top: 2.h),
                                              child: const Icon(
                                                  Icons.arrow_circle_right)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 8.w,
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
