import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../controller/restaurants/browserestaurantcontroller.dart';
import '../../../controller/restaurants/restaurantscontroller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';

class ObxBestFoodRestauran extends GetView<BrowseRestaurantController> {
  const ObxBestFoodRestauran({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantsController restaurantsController =
        Get.find<RestaurantsController>();
    return Obx(
      () => Container(
        child: controller.statusRequest == StatusRequest.serverfailure
            ? null
            : SizedBox(
                child:
                    controller.bestproductsrestaurantModle.value.status == null
                        ? const Center(child: CircularProgressIndicator())
                        : controller.bestproductsrestaurantList.isEmpty
                            ? const Text('No find data')
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Best Food :',
                                    style: GoogleFonts.cairo(
                                      fontSize: 18.0.sp,
                                      color: const Color(0xFF333333),
                                      fontWeight: FontWeight.w700,
                                      height: 1.44.h,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  LazyLoadScrollView(
                                    scrollDirection: Axis.horizontal,
                                    onEndOfPage: () {
                                      if (controller.bestproductsrestaurantModle
                                              .value.data!.currentPage !=
                                          controller.bestproductsrestaurantModle
                                              .value.data!.lastPage) {
                                        controller.bestproductsrestaurantData(
                                            (int.parse(controller
                                                        .bestproductsrestaurantModle
                                                        .value
                                                        .data!
                                                        .currentPage
                                                        .toString()) +
                                                    1)
                                                .toString(),
                                            restaurantsController
                                                .restaurantModle
                                                .value
                                                .data!
                                                .id!);
                                      }
                                    },
                                    child: SizedBox(
                                      height: 165.h,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controller
                                                .bestproductsrestaurantList
                                                .length +
                                            1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          if (index <
                                              controller
                                                  .bestproductsrestaurantList
                                                  .length) {
                                            // Build your list item widget here
                                            return Container(
                                              // width: 150,
                                              // // padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  color: AppColor.maincoloroff
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r)),
                                              child: Column(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.r),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: controller
                                                              .bestproductsrestaurantList[
                                                                  index]
                                                              .photo
                                                              .toString(),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              const Icon(
                                                                  Icons.error),
                                                          fit: BoxFit.cover,
                                                          width: 120.w,
                                                          height: 120.h,
                                                        ),
                                                      ),
                                                      Positioned(
                                                          top: 5.h,
                                                          left: 10.w,
                                                          child: controller
                                                                      .bestproductsrestaurantList[
                                                                          index]
                                                                      .offer ==
                                                                  1
                                                              ? Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          3.h,
                                                                      horizontal:
                                                                          6.w),
                                                                  decoration: BoxDecoration(
                                                                      color: AppColor
                                                                          .maincolor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.r)),
                                                                  child:
                                                                      //  Text('${controller.dataBestProducts.value.data![index].offerValue}'),
                                                                      Center(
                                                                          child:
                                                                              Text(
                                                                    '5%',
                                                                    style: TextStyle(
                                                                        fontSize: 12
                                                                            .sp
                                                                            .sp,
                                                                        color: Colors
                                                                            .white),
                                                                  )),
                                                                )
                                                              : Container()),
                                                      Positioned(
                                                          top: 5.h,
                                                          right: 10.w,
                                                          child: controller
                                                                      .bestproductsrestaurantList[
                                                                          index]
                                                                      .wishlist ==
                                                                  0
                                                              ? Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          3.h,
                                                                      horizontal:
                                                                          3.w),
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.7),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.r)),
                                                                  child:
                                                                      //  Text('${controller.dataBestProducts.value.data![index].offerValue}'),
                                                                      Center(
                                                                          child: Icon(
                                                                              Icons.favorite_outline,
                                                                              size: 15.r,
                                                                              color: Colors.white)),
                                                                )
                                                              : Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          3.h,
                                                                      horizontal:
                                                                          3.w),
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.7),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.r)),
                                                                  child:
                                                                      //  Text('${controller.dataBestProducts.value.data![index].offerValue}'),
                                                                      Center(
                                                                          child: Icon(
                                                                              Icons.favorite,
                                                                              size: 15.r,
                                                                              color: Colors.red)),
                                                                )),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 2,
                                                  ),
                                                  SizedBox(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width: 85.w,
                                                              child: Text(
                                                                  "${controller.bestproductsrestaurantList[index].name}",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            ),
                                                            Text(
                                                              "${controller.bestproductsrestaurantList[index].category!.name}",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  color: Colors
                                                                      .grey),
                                                            )
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2.h),
                                                          child: Text(
                                                            '${double.parse(controller.bestproductsrestaurantList[index].price.toString()).toStringAsFixed(1)}'
                                                            '\$',
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color: AppColor
                                                                    .maincolor),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else if (controller
                                                  .bestproductsrestaurantModle
                                                  .value
                                                  .data!
                                                  .currentPage ==
                                              controller
                                                  .bestproductsrestaurantModle
                                                  .value
                                                  .data!
                                                  .lastPage) {
                                            // Show an empty state message
                                            return Padding(
                                              padding: EdgeInsets.all(16.0.r),
                                              child: const Center(
                                                child: Text('No items found.'),
                                              ),
                                            );
                                          } else if (controller
                                              .bestproductsrestaurantList
                                              .isNotEmpty) {
                                            // Show a loading indicator at the end of the list
                                            // controller.bestproductsrestaurantData();
                                            return Padding(
                                              padding: EdgeInsets.all(16.0.r),
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          }
                                          return null;
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            width: 8.w,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
              ),
      ),
    );
  }
}
