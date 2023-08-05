import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/address/restaurantlocationcontroller.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/nameroutes.dart';

class ChoseAddress extends StatelessWidget {
  const ChoseAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RestaurantLocationController());
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(
            NameRoutes.addaddress,
          );
        },
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'New Address',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
            SizedBox(
              width: 5.w,
            ),
            Icon(
              Icons.add_location,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
      body: GetBuilder<RestaurantLocationController>(
          builder: (controller) => Stack(children: [
                Positioned(
                  top: -120.w,
                  left: 0,
                  child: SvgPicture.asset(
                    ImageAsset.pattern,
                    // color: AppColor.maincolor,
                    // width: double.infinity,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20.h,
                    right: 20.h,
                  ),
                  height: double.infinity,
                  child: Column(children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 80.h),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text(
                          'My Address',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.cairo(
                            fontSize: 18.0,
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.w700,
                            height: 1.44,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: Obx(
                        () => Container(
                          child: controller.addressModle.value.data == null
                              ? const Center(child: CircularProgressIndicator())
                              : controller.addressModle.value.data!.isEmpty
                                  ? const Text('Add an address')
                                  : Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: ListView.separated(
                                        // physics:NeverScrollableScrollPhysics(),
                                        itemCount: controller
                                            .addressModle.value.data!.length,

                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              controller.getCurrentLocation(
                                                  controller.lat_res,
                                                  controller.long_res,
                                                  double.parse(controller
                                                      .addressModle
                                                      .value
                                                      .data![index]
                                                      .latitude!),
                                                  double.parse(controller
                                                      .addressModle
                                                      .value
                                                      .data![index]
                                                      .longitude!));
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: 65.0.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0.r),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: const Color(
                                                                      0xFFED771C)
                                                                  .withOpacity(
                                                                      0.05),
                                                              offset:
                                                                  const Offset(
                                                                      1.0, 1.0),
                                                              blurRadius: 20.0,
                                                            ),
                                                          ],
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          child: Image.asset(
                                                            ImageAsset.address,
                                                            fit: BoxFit.cover,
                                                            width: 75.w,
                                                            height: 65.h,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      SizedBox(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              controller
                                                                  .addressModle
                                                                  .value
                                                                  .data![index]
                                                                  .name
                                                                  .toString(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              style: GoogleFonts
                                                                  .cairo(
                                                                fontSize: 14.0,
                                                                color: const Color(
                                                                    0xFF333333),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                height: 1.57,
                                                              ),
                                                            ),
                                                            Text(
                                                              controller
                                                                  .addressModle
                                                                  .value
                                                                  .data![index]
                                                                  .address
                                                                  .toString(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              style: GoogleFonts
                                                                  .cairo(
                                                                fontSize: 14.0,
                                                                color: const Color(
                                                                        0xFF333333)
                                                                    .withOpacity(
                                                                        0.7),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                height: 1.83,
                                                              ),
                                                            ),
                                                            Text(
                                                              controller
                                                                  .addressModle
                                                                  .value
                                                                  .data![index]
                                                                  .mobile
                                                                  .toString(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              style: GoogleFonts
                                                                  .cairo(
                                                                fontSize: 10.0,
                                                                color: const Color(
                                                                        0xFF333333)
                                                                    .withOpacity(
                                                                        0.7),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                height: 1.4,
                                                              ),
                                                            ),
                                                            // Group: Group 477
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            height: 8.h,
                                          );
                                        },
                                      ),
                                    ),
                        ),
                      ),
                    )
                  ]),
                ),
              ])),
    );
  }
}
