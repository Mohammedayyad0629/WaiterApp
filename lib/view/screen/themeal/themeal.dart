import 'dart:developer';

import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waiter/core/constant/imageasset.dart';
import '../../../controller/cartcontroller.dart';
import '../../../controller/favorite/favoritecontroller.dart';
import '../../../controller/restaurants/themealcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/nameroutes.dart';

class TheMeal extends StatelessWidget {
  const TheMeal({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.find<FavoriteController>();
    TheMealController controller = Get.find<TheMealController>();
    CartController cartController = Get.find<CartController>();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          cartController.addMyCart(
              controller.theMealModle.value.data!.id!.toString(),
              controller.quantity.toString());
          Get.toNamed(
            NameRoutes.cart,
          );
        },
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add to Cart',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
            SizedBox(
              width: 5.w,
            ),
            SvgPicture.asset(
              ImageAsset.twotonebag,
              color: Colors.white,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<TheMealController>(builder: (controller) {
        return Obx(
          () => SizedBox(
            child: controller.theMealModle.value.status == null
                ? const Center(child: CircularProgressIndicator())
                : controller.theMealModle.value.data == 0
                    ? const Text('No find data')
                    : Stack(
                        children: [
                          Positioned(
                            top: 50,
                            child: Blur(
                              blur: 2,
                              blurColor: Colors.white,
                              child: Container(
                                width: Get.width,
                                padding:
                                    EdgeInsets.only(left: 20.w, right: 20.w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            ImageAsset.category,
                                            color: AppColor.maincolor,
                                            width: 30,
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: controller
                                                          .theMealModle
                                                          .value
                                                          .data!
                                                          .restaurant !=
                                                      null
                                                  ? Text(
                                                      controller
                                                          .theMealModle
                                                          .value
                                                          .data!
                                                          .restaurant!
                                                          .name
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 18.sp),
                                                    )
                                                  : null),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            ImageAsset.clipboardtick,
                                            // color: AppColor.maincolor,
                                          ),
                                          Obx(
                                            () => cartController.cartModle.value
                                                        .status ==
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
                                                                      vertical:
                                                                          1),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  color: Colors
                                                                      .red),
                                                              child: Text(
                                                                cartController
                                                                    .cartModle
                                                                    .value
                                                                    .data!
                                                                    .length
                                                                    .toString(),
                                                                style:
                                                                    GoogleFonts
                                                                        .cairo(
                                                                  fontSize: 9.0,
                                                                  color: Colors
                                                                      .white,
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
                            ),
                          ),
                          ListView(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 80.h),
                                  padding: EdgeInsets.only(bottom: 50.h),
                                  // height: Get.height,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColor.maincolor
                                              .withOpacity(0.3),
                                          spreadRadius: 0.1,
                                          blurRadius: 30,
                                          offset: const Offset(0, 0)),
                                    ],
                                    // border: Border.all(
                                    //     color: AppColor.maincolor
                                    //         .withOpacity(0.2),
                                    //     width: 3),
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(42)),
                                  ),
                                  child: GetBuilder<TheMealController>(
                                      builder: (controller) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Center(
                                                child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    42),
                                                            topRight:
                                                                Radius.circular(
                                                                    42)),
                                                    child: CachedNetworkImage(
                                                      imageUrl: controller
                                                          .theMealModle
                                                          .value
                                                          .data!
                                                          .photo!,
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                      fit: BoxFit.fill,
                                                      width: double.infinity,
                                                      height: 250,
                                                    ))),
                                            Positioned(
                                              left: 15,
                                              top: 15,
                                              child: InkWell(
                                                onTap: () {
                                                  log('sucsses');
                                                  favoriteController
                                                      .addFavoriteOrRemove(
                                                          controller
                                                              .theMealModle
                                                              .value
                                                              .data!
                                                              .id
                                                              .toString());
                                                  log(controller.theMealModle
                                                      .value.data!.wishlist!
                                                      .toString());
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .theMealModle
                                                                  .value
                                                                  .data!
                                                                  .wishlist! ==
                                                              0
                                                          ? AppColor.maincolor
                                                          : Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Icon(
                                                    Icons.favorite,
                                                    color: controller
                                                                .theMealModle
                                                                .value
                                                                .data!
                                                                .wishlist! >
                                                            0
                                                        ? AppColor.maincolor
                                                        : Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  controller.theMealModle.value
                                                              .data!.enName ==
                                                          null
                                                      ? Expanded(
                                                          child: Text(
                                                            controller
                                                                .theMealModle
                                                                .value
                                                                .data!
                                                                .name
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: GoogleFonts
                                                                .cairo(
                                                              fontSize: 18.0,
                                                              color: const Color(
                                                                  0xFF333333),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              height: 1.44,
                                                            ),
                                                            textAlign:
                                                                TextAlign.right,
                                                          ),
                                                        )
                                                      : Text(
                                                          controller
                                                              .theMealModle
                                                              .value
                                                              .data!
                                                              .enName
                                                              .toString(),
                                                          style:
                                                              GoogleFonts.cairo(
                                                            fontSize: 18.0,
                                                            color: const Color(
                                                                0xFF333333),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.44,
                                                          ),
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                        size: 20,
                                                      ),
                                                      Text(
                                                        '4.5',
                                                        style:
                                                            GoogleFonts.cairo(
                                                          fontSize: 12.0,
                                                          color: const Color(
                                                              0xFF333333),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  controller.theMealModle.value
                                                      .data!.description
                                                      .toString(),
                                                  style: GoogleFonts.cairo(
                                                    fontSize: 14.0,
                                                    color:
                                                        const Color(0xFF333333)
                                                            .withOpacity(0.7),
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'The time required to prepare the meal :',
                                                    style: GoogleFonts.cairo(
                                                      fontSize: 14.0,
                                                      color: const Color(
                                                          0xFFED771C),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.5,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  Text(
                                                    '10 minutes',
                                                    style: GoogleFonts.cairo(
                                                      fontSize: 16.0,
                                                      color: const Color(
                                                          0xFFED771C),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 5),
                                                    child: Text(
                                                      'Quantity:',
                                                      style: GoogleFonts.cairo(
                                                        fontSize: 18.0,
                                                        color: const Color(
                                                            0xFF333333),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: 1.44,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .removeQuantity();
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.r),
                                                          child: const Icon(
                                                            Icons.remove_circle,
                                                            color: AppColor
                                                                .maincolor,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        controller.quantity
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.cairo(
                                                          fontSize: 16.0,
                                                          color: const Color(
                                                              0xFF333333),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1.38,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .addQuantity();
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.r),
                                                          child: const Icon(
                                                            Icons.add_circle,
                                                            color: AppColor
                                                                .maincolor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Divider(
                                                color: AppColor.maincolor
                                                    .withOpacity(0.5),
                                                height: 3,
                                                thickness: 1.3,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Total Price:',
                                                    style: GoogleFonts.cairo(
                                                      fontSize: 18.0,
                                                      color: const Color(
                                                          0xFF333333),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 1.44,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      '${double.parse(controller.totalPrice.toString()).toStringAsFixed(1)}'
                                                      '\$',
                                                      style: GoogleFonts.cairo(
                                                        fontSize: 18.0,
                                                        color: const Color(
                                                            0xFF333333),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              controller
                                                          .theMealModle
                                                          .value
                                                          .data!
                                                          .extras!
                                                          .length >
                                                      0
                                                  ? Column(
                                                      children: [
                                                        Divider(
                                                          color: AppColor
                                                              .maincolor
                                                              .withOpacity(0.5),
                                                          // height: ,
                                                          thickness: 1.3,
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: Text(
                                                            'Extras:',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: GoogleFonts
                                                                .cairo(
                                                              fontSize: 18.0,
                                                              color: const Color(
                                                                  0xFF333333),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              height: 1.44,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 90.h,
                                                          child: ListView
                                                              .separated(
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          int
                                                                              index) {
                                                                    return InkWell(
                                                                      onTap:
                                                                          () {},
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              imageUrl: controller.theMealModle.value.data!.extras![index].photo!,
                                                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                                                              height: 70,
                                                                              width: 70,
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                          ),
                                                                          Text(controller
                                                                              .theMealModle
                                                                              .value
                                                                              .data!
                                                                              .extras![index]
                                                                              .name!)
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                  separatorBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          int
                                                                              index) {
                                                                    return VerticalDivider(
                                                                      color: AppColor
                                                                          .maincolor
                                                                          .withOpacity(
                                                                              0.5),
                                                                      // width: 8,
                                                                      thickness:
                                                                          1.5,
                                                                    );
                                                                  },
                                                                  itemCount: controller
                                                                      .theMealModle
                                                                      .value
                                                                      .data!
                                                                      .extras!
                                                                      .length),
                                                        )
                                                      ],
                                                    )
                                                  : Container(),
                                              Divider(
                                                color: AppColor.maincolor
                                                    .withOpacity(0.5),
                                                // height: ,
                                                thickness: 1.3,
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  'Similar Meals :',
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.cairo(
                                                    fontSize: 18.0,
                                                    color:
                                                        const Color(0xFF333333),
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.44,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              SizedBox(
                                                height: 90.h,
                                                child: ListView.separated(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return InkWell(
                                                        onTap: () {},
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl: controller
                                                                    .theMealModle
                                                                    .value
                                                                    .data!
                                                                    .similarMeals![
                                                                        index]
                                                                    .photo!,
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    const Icon(Icons
                                                                        .error),
                                                                height: 70,
                                                                width: 70,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                            Text(controller
                                                                .theMealModle
                                                                .value
                                                                .data!
                                                                .similarMeals![
                                                                    index]
                                                                .name!)
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return VerticalDivider(
                                                        color: AppColor
                                                            .maincolor
                                                            .withOpacity(0.5),
                                                        // width: 8,
                                                        thickness: 1.5,
                                                      );
                                                    },
                                                    itemCount: controller
                                                        .theMealModle
                                                        .value
                                                        .data!
                                                        .similarMeals!
                                                        .length),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  })),
                            ],
                          ),
                        ],
                      ),
          ),
        );
      }),
    );
  }
}
