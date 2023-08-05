import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/favorite/favoritecontroller.dart';
import '../../../controller/home/homepagecontroller.dart';
import '../../../controller/restaurants/themealcontroller.dart';
import '../../../core/constant/color.dart';

class ObxBestMealsHome extends GetView<HomepageController> {
  const ObxBestMealsHome({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.find();
    TheMealController theMealController = Get.find();

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Best Meals:',
            style: GoogleFonts.cairo(
              fontSize: 18.0.sp,
              color: const Color(0xFF333333),
              fontWeight: FontWeight.w700,
              height: 1.44.h,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 165.h,
            width: double.infinity,
            child: controller.dataBestProducts.value.status == null
                ? const Center(child: CircularProgressIndicator())
                : controller.dataBestProducts.value.data!.isEmpty
                    ? const Text('No find data')
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            controller.dataBestProducts.value.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              theMealController.getTheMeal(controller
                                  .dataBestProducts.value.data![index].id
                                  .toString());
                            },
                            child: Container(
                              // width: 150,
                              // // padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: AppColor.maincoloroff.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15.r)),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        child: CachedNetworkImage(
                                          imageUrl: controller.dataBestProducts
                                              .value.data![index].photo!,
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          fit: BoxFit.cover,
                                          width: 120.w,
                                          height: 120.h,
                                        ),
                                      ),
                                      Positioned(
                                          top: 5.h,
                                          left: 10.w,
                                          child: controller
                                                      .dataBestProducts
                                                      .value
                                                      .data![index]
                                                      .offer ==
                                                  1
                                              ? Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 3.h,
                                                      horizontal: 6.w),
                                                  decoration: BoxDecoration(
                                                      color: AppColor.maincolor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child:
                                                      //  Text('${controller.dataBestProducts.value.data![index].offerValue}'),
                                                      Center(
                                                          child: Text(
                                                    '5%',
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: Colors.white),
                                                  )),
                                                )
                                              : Container()),
                                      Positioned(
                                          top: 5.h,
                                          right: 10.w,
                                          child: controller
                                                      .dataBestProducts
                                                      .value
                                                      .data![index]
                                                      .wishlist ==
                                                  0
                                              ? InkWell(
                                                  onTap: () {
                                                    favoriteController
                                                        .addFavoriteOrRemove(
                                                            controller
                                                                .dataBestProducts
                                                                .value
                                                                .data![index]
                                                                .id
                                                                .toString());
                                                    print('sucsses');
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(3.0.r),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 3.h,
                                                              horizontal: 3.w),
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(0.7),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.r)),
                                                      child:
                                                          //  Text('${controller.dataBestProducts.value.data![index].offerValue}'),
                                                          Center(
                                                              child: Icon(
                                                                  Icons
                                                                      .favorite_outline,
                                                                  size: 15.r,
                                                                  color: Colors
                                                                      .white)),
                                                    ),
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    favoriteController
                                                        .addFavoriteOrRemove(
                                                            controller
                                                                .dataBestProducts
                                                                .value
                                                                .data![index]
                                                                .id
                                                                .toString());
                                                    print('sucsses');
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 3.h,
                                                            horizontal: 3.w),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child:
                                                        //  Text('${controller.dataBestProducts.value.data![index].offerValue}'),
                                                        Center(
                                                            child: Icon(
                                                                Icons.favorite,
                                                                size: 15.r,
                                                                color: Colors
                                                                    .red)),
                                                  ),
                                                )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SizedBox(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 85.w,
                                              child: Text(
                                                  "${controller.dataBestProducts.value.data![index].name}",
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
                                              "${controller.dataBestProducts.value.data![index].category!.name}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 2.h),
                                          child: Text(
                                            '${double.parse(controller.dataBestProducts.value.data![index].price!).toStringAsFixed(1)}'
                                            '\$',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: AppColor.maincolor),
                                          ),
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
