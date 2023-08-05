import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/categorymealscontroller.dart';
import '../../../controller/home/homepagecontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/nameroutes.dart';

class ObxCategoriesHome extends GetView<HomepageController> {
  const ObxCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryMealsController categoryMealsController =
        Get.put(CategoryMealsController());
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories:',
            style: GoogleFonts.cairo(
              fontSize: 18.0,
              color: const Color(0xFF333333),
              fontWeight: FontWeight.w700,
              height: 1.44,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
              height: 80.h,
              child: controller.dataCategories.value.status == null
                  ? const Center(child: CircularProgressIndicator())
                  : controller.dataCategories.value.data!.isEmpty
                      ? const Text('No find data')
                      : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              controller.dataCategories.value.data!.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              categoryMealsController.getcategoryMealsData(
                                  controller
                                      .dataCategories.value.data![index].id
                                      .toString());
                              Get.toNamed(NameRoutes.categorymeals, arguments: {
                                'nameCategory': controller
                                    .dataCategories.value.data![index].name,
                              });
                              categoryMealsController.getNameCategory(controller
                                  .dataCategories.value.data![index].name!);
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
                          separatorBuilder: (BuildContext context, int index) {
                            return VerticalDivider(
                              color: AppColor.maincolor.withOpacity(0.5),
                              width: 8.w,
                              thickness: 1.5,
                            );
                          },
                        )),
        ],
      ),
    );
  }
}
