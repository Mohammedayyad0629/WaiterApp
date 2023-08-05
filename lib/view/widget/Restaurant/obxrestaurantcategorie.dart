import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/restaurants/browserestaurantcontroller.dart';
import '../../../controller/restaurants/restaurantscontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/nameroutes.dart';

class ObxRestaurantCategorie extends GetView<BrowseRestaurantController> {
  const ObxRestaurantCategorie({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantsController restaurantsController =
        Get.find<RestaurantsController>();

    return Obx(() => SizedBox(
          width: double.infinity,
          child: controller.dataCategories.value.status == null
              ? const Center(child: CircularProgressIndicator())
              : controller.dataCategories.value.data!.isEmpty
                  ? null
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categories :',
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
                        SizedBox(
                          height: 80.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                controller.dataCategories.value.data!.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                controller.getmealsrestaurantData(
                                    '1',
                                    restaurantsController
                                        .restaurantModle.value.data!.id!,
                                    controller
                                        .dataCategories.value.data![index].id!);
                                Get.toNamed(NameRoutes.mealsrestaurants,
                                    arguments: {
                                      'idResturent': controller.idResturent,
                                      'nameCategory': controller.dataCategories
                                          .value.data![index].name,
                                      'idCategories': controller
                                          .dataCategories.value.data![index].id
                                    });
                                controller.getNameCategory();
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50.r),
                                    child: CachedNetworkImage(
                                      imageUrl: controller.dataCategories.value
                                          .data![index].photo!,
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      height: 50.h,
                                      width: 50.w,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(controller
                                      .dataCategories.value.data![index].name!)
                                ],
                              ),
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return VerticalDivider(
                                color: AppColor.maincolor.withOpacity(0.5),
                                width: 8.w,
                                thickness: 1.5,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
        ));
  }
}
