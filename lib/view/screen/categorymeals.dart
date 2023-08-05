import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/cartcontroller.dart';
import '../../controller/categorymealscontroller.dart';
import '../../controller/restaurants/themealcontroller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class CategoryMeals extends StatelessWidget {
  const CategoryMeals({super.key});

  @override
  Widget build(BuildContext context) {
    TheMealController theMealController = Get.find<TheMealController>();
    CartController cartController = Get.find<CartController>();

    Get.find<CategoryMealsController>();

    return Scaffold(
      body: GetBuilder<CategoryMealsController>(
          builder: (controller) => Stack(children: [
                Positioned(
                    top: -120.w,
                    left: 0,
                    child: SvgPicture.asset(
                      ImageAsset.pattern,
                      // color: AppColor.maincolor,
                      // width: double.infinity,
                    )),
                Container(
                    margin: EdgeInsets.only(
                      left: 20.h,
                      right: 20.h,
                    ),
                    height: double.infinity,
                    child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 80.h),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        ImageAsset.category,
                                        color: AppColor.maincolor,
                                        width: 30.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.h),
                                        child: Text(
                                          controller.nameCategory!,
                                          style: TextStyle(fontSize: 18.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        ImageAsset.clipboardtick,
                                        // color: AppColor.maincolor,
                                      ),
                                      Obx(
                                        () => cartController
                                                    .cartModle.value.status ==
                                                null
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                strokeWidth: 2,
                                              ))
                                            : Stack(
                                                children: [
                                                  SvgPicture.asset(
                                                    ImageAsset.twotonebag,
                                                    // color: AppColor.maincolor,
                                                  ),
                                                  Positioned(
                                                      bottom: 0,
                                                      right: 0,
                                                      child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      2.w,
                                                                  vertical: 1),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              color:
                                                                  Colors.red),
                                                          child: Text(
                                                            cartController
                                                                .cartModle
                                                                .value
                                                                .data!
                                                                .length
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .cairo(
                                                              fontSize: 9.0,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              height: 1.1,
                                                            ),
                                                          )))
                                                ],
                                              ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Obx(
                            () => SizedBox(
                              height: Get.height,
                              width: double.infinity,
                              child: controller.categoryMealsModle.value.data ==
                                      null
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : controller.categoryMealsModle.value.data!
                                          .isEmpty
                                      ? const Text('No find data')
                                      : Container(
                                          padding:
                                              const EdgeInsets.only(bottom: 15),
                                          child: ListView.separated(
                                            // physics:NeverScrollableScrollPhysics(),
                                            itemCount: controller
                                                .categoryMealsModle
                                                .value
                                                .data![0]
                                                .meals!
                                                .length,

                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: () {
                                                  theMealController.getTheMeal(
                                                      controller
                                                          .categoryMealsModle
                                                          .value
                                                          .data![0]
                                                          .meals![index]
                                                          .id
                                                          .toString());
                                                  //
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
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
                                                                        1.0,
                                                                        1.0),
                                                                blurRadius:
                                                                    20.0,
                                                              ),
                                                            ],
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: controller
                                                                  .categoryMealsModle
                                                                  .value
                                                                  .data![0]
                                                                  .meals![index]
                                                                  .photo
                                                                  .toString(),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  const Icon(Icons
                                                                      .error),
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
                                                          width:
                                                              Get.width / 2.4.h,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                controller
                                                                    .categoryMealsModle
                                                                    .value
                                                                    .data![0]
                                                                    .meals![
                                                                        index]
                                                                    .name
                                                                    .toString(),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                style:
                                                                    GoogleFonts
                                                                        .cairo(
                                                                  fontSize:
                                                                      14.0,
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
                                                                    .categoryMealsModle
                                                                    .value
                                                                    .data![0]
                                                                    .meals![
                                                                        index]
                                                                    .description
                                                                    .toString(),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                style:
                                                                    GoogleFonts
                                                                        .cairo(
                                                                  fontSize:
                                                                      12.0,
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
                                                              // Group: Group 477

                                                              SizedBox(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Colors
                                                                          .yellow,
                                                                      size: 20,
                                                                    ),
                                                                    Text(
                                                                      '4.5',
                                                                      style: GoogleFonts
                                                                          .cairo(
                                                                        fontSize:
                                                                            12.0,
                                                                        color: const Color(
                                                                            0xFF333333),
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        // Group: Group 479

                                                        SizedBox(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment(
                                                                        0.0,
                                                                        0.2),
                                                                child:
                                                                    // Group: vuesax/bold/tag
                                                                    SvgPicture
                                                                        .asset(
                                                                  // tag
                                                                  ImageAsset
                                                                      .price,
                                                                ),
                                                              ),
                                                              Text(
                                                                '${double.parse(controller.categoryMealsModle.value.data![0].meals![index].price!).toStringAsFixed(1)}'
                                                                '\$',
                                                                style:
                                                                    GoogleFonts
                                                                        .cairo(
                                                                  fontSize:
                                                                      18.0,
                                                                  color: const Color(
                                                                      0xFF333333),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  height: 1.22,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        // Group: Group 478

                                                        InkWell(
                                                          onTap: () {
                                                            cartController.addMyCart(
                                                                controller
                                                                    .categoryMealsModle
                                                                    .value
                                                                    .data![0]
                                                                    .meals![
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                                1.toString());
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              SvgPicture.asset(
                                                                  ImageAsset
                                                                      .twotonebag),
                                                              Text(
                                                                'اضف للسلة',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                style:
                                                                    GoogleFonts
                                                                        .cairo(
                                                                  fontSize:
                                                                      12.0,
                                                                  color: const Color(
                                                                      0xFF333333),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  height: 1.83,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return SizedBox(
                                                height: 8.h,
                                              );
                                            },
                                          ),
                                        ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ]))
              ])),
    );
  }
}
