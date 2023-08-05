import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/favorite/favoritecontroller.dart';
import '../../controller/restaurants/themealcontroller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<FavoriteController>();
    TheMealController theMealController = Get.find<TheMealController>();

    return Scaffold(
      body: GetBuilder<FavoriteController>(
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    ImageAsset.category,
                                    color: AppColor.maincolor,
                                    width: 30.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.h),
                                    child: Text(
                                      'Favorite',
                                      style: GoogleFonts.cairo(
                                        fontSize: 18.0,
                                        color: const Color(0xFF333333),
                                        fontWeight: FontWeight.w700,
                                        height: 1.44,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'Available items',
                            style: GoogleFonts.cairo(
                              fontSize: 18.0,
                              color: const Color(0xFF333333),
                              fontWeight: FontWeight.w700,
                              height: 1.44,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Obx(
                            () => SizedBox(
                              height: Get.height,
                              width: double.infinity,
                              child: controller.favoriteModle.value.data == null
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : controller.favoriteModle.value.data!.isEmpty
                                      ? const Text('No find data')
                                      : Container(
                                          margin: EdgeInsets.only(bottom: 170),
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: ListView.separated(
                                            // physics:NeverScrollableScrollPhysics(),
                                            itemCount: controller.favoriteModle
                                                .value.data!.length,

                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: () {
                                                  theMealController.getTheMeal(
                                                      controller
                                                          .favoriteModle
                                                          .value
                                                          .data![index]
                                                          .productId
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
                                                                  .favoriteModle
                                                                  .value
                                                                  .data![index]
                                                                  .product!
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
                                                                    .favoriteModle
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .product!
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
                                                                    .favoriteModle
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .product!
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
                                                              SizedBox(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '${double.parse(controller.favoriteModle.value.data![index].product!.price!).toStringAsFixed(1)}'
                                                                      '\$',
                                                                      style: GoogleFonts
                                                                          .cairo(
                                                                        fontSize:
                                                                            14.0,
                                                                        color: const Color(
                                                                            0xFF333333),
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        height:
                                                                            1.22,
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

                                                        // Group: Group 478

                                                        InkWell(
                                                          onTap: () {
                                                            controller.addFavoriteOrRemove(
                                                                controller
                                                                    .favoriteModle
                                                                    .value
                                                                    .data![
                                                                        index]
                                                                    .productId
                                                                    .toString());
                                                            log(controller
                                                                .favoriteModle
                                                                .value
                                                                .data![index]
                                                                .id
                                                                .toString());
                                                            controller
                                                                .getFavorite();
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Delete',
                                                                style:
                                                                    GoogleFonts
                                                                        .cairo(
                                                                  fontSize:
                                                                      12.0,
                                                                  color: const Color(
                                                                          0xFF333333)
                                                                      .withOpacity(
                                                                          0.8),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  height: 1.83,
                                                                ),
                                                              ),
                                                              Icon(Icons
                                                                  .delete_forever)
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
