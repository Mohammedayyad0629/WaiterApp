import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../controller/cartcontroller.dart';
import '../../../controller/restaurants/browserestaurantcontroller.dart';
import '../../../controller/restaurants/themealcontroller.dart';
import '../../../core/constant/imageasset.dart';

class ObxMealsRestaurant extends GetView<BrowseRestaurantController> {
  const ObxMealsRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    TheMealController theMealController = Get.find<TheMealController>();

    CartController cartController = Get.find<CartController>();

    return Obx(
      () => Container(
        margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 100.h),
        height: Get.height,
        width: double.infinity,
        child: controller.mealsrestaurantrestaurantList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : controller.mealsrestaurantrestaurantList.isEmpty
                ? const Text('No find data')
                : LazyLoadScrollView(
                    onEndOfPage: () {
                      if (controller
                              .mealsrestaurantModle.value.data!.currentPage !=
                          controller
                              .mealsrestaurantModle.value.data!.lastPage) {
                        controller.getmealsrestaurantData(
                            (int.parse(controller.mealsrestaurantModle.value
                                        .data!.currentPage
                                        .toString()) +
                                    1)
                                .toString(),
                            controller.idResturent!,
                            controller.idCategories!);
                      }
                    },
                    child: Container(
                      // margin: EdgeInsets.only(bottom: 100.h),
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ListView.separated(
                        // physics:NeverScrollableScrollPhysics(),
                        itemCount:
                            controller.mealsrestaurantrestaurantList.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index <
                              controller.mealsrestaurantrestaurantList.length) {
                            // Build your list item widget here
                            return InkWell(
                              onTap: () {
                                theMealController.getTheMeal(controller
                                    .mealsrestaurantrestaurantList[index].id
                                    .toString());
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 65.0.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xFFED771C)
                                                  .withOpacity(0.05),
                                              offset: const Offset(1.0, 1.0),
                                              blurRadius: 20.0,
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          child: CachedNetworkImage(
                                            imageUrl: controller
                                                .mealsrestaurantrestaurantList[
                                                    index]
                                                .photo
                                                .toString(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
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
                                        width: Get.width / 2.4.h,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller
                                                  .mealsrestaurantrestaurantList[
                                                      index]
                                                  .name
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: GoogleFonts.cairo(
                                                fontSize: 14.0.sp,
                                                color: const Color(0xFF333333),
                                                fontWeight: FontWeight.w700,
                                                height: 1.57.h,
                                              ),
                                            ),
                                            Text(
                                              controller
                                                  .mealsrestaurantrestaurantList[
                                                      index]
                                                  .description
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: GoogleFonts.cairo(
                                                fontSize: 12.0.sp,
                                                color: const Color(0xFF333333)
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w600,
                                                height: 1.83.h,
                                              ),
                                            ),
                                            // Group: Group 477

                                            SizedBox(
                                              child: Row(
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
                                                    style: GoogleFonts.cairo(
                                                      fontSize: 12.0.sp,
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      // Group: Group 479

                                      SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: Alignment(0.0, 0.2),
                                              child:
                                                  // Group: vuesax/bold/tag
                                                  SvgPicture.asset(
                                                // tag
                                                ImageAsset.price,
                                              ),
                                            ),
                                            Text(
                                              '${double.parse(controller.mealsrestaurantrestaurantList[index].price!).toStringAsFixed(1)}'
                                              '\$',
                                              style: GoogleFonts.cairo(
                                                fontSize: 18.0.sp,
                                                color: const Color(0xFF333333),
                                                fontWeight: FontWeight.w600,
                                                height: 1.22.h,
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
                                                  .mealsrestaurantrestaurantList[
                                                      index]
                                                  .id
                                                  .toString(),
                                              '1');
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset(
                                                ImageAsset.twotonebag),
                                            Text(
                                              'اضف للسلة',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: GoogleFonts.cairo(
                                                fontSize: 12.0.sp,
                                                color: const Color(0xFF333333),
                                                fontWeight: FontWeight.w600,
                                                height: 1.83.h,
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
                          } else if (controller.mealsrestaurantModle.value.data!
                                  .currentPage ==
                              controller
                                  .mealsrestaurantModle.value.data!.lastPage) {
                            // Show an empty state message
                            return Padding(
                              padding: EdgeInsets.all(16.0.r),
                              child: const Center(
                                child: Text('No\'t More Items.'),
                              ),
                            );
                          } else if (controller
                              .mealsrestaurantrestaurantList.isNotEmpty) {
                            // Show a loading indicator at the end of the list
                            // controller.bestproductsrestaurantData();
                            return Padding(
                              padding: EdgeInsets.all(16.0.r),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          return null;
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 8.h,
                          );
                        },
                      ),
                    ),
                  ),
      ),
    );
  }
}
