import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/cartcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class ObxCartView extends GetView<CartController> {
  const ObxCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => SizedBox(
          width: double.infinity,
          child: controller.cartModle.value.data == null
              ? const Center(child: CircularProgressIndicator())
              : controller.cartModle.value.data!.isEmpty
                  ? const Text('No find data')
                  : Container(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: ListView.separated(
                        // physics:NeverScrollableScrollPhysics(),
                        itemCount: controller.cartModle.value.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            blurRadius: 20.0.r,
                                          ),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        child: CachedNetworkImage(
                                          imageUrl: controller.cartModle.value
                                              .data![index].product!.photo!,
                                          errorWidget: (context, url, error) =>
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
                                          controller
                                                      .cartModle
                                                      .value
                                                      .data![index]
                                                      .product!
                                                      .enName !=
                                                  null
                                              ? Text(
                                                  controller
                                                      .cartModle
                                                      .value
                                                      .data![index]
                                                      .product!
                                                      .enName!
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: GoogleFonts.cairo(
                                                    fontSize: 14.0.sp,
                                                    color:
                                                        const Color(0xFF333333),
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.57.h,
                                                  ),
                                                )
                                              : Text(
                                                  controller
                                                      .cartModle
                                                      .value
                                                      .data![index]
                                                      .product!
                                                      .name!
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: GoogleFonts.cairo(
                                                    fontSize: 14.0.sp,
                                                    color:
                                                        const Color(0xFF333333),
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.57.h,
                                                  ),
                                                ),
                                          Text(
                                            controller
                                                .cartModle
                                                .value
                                                .data![index]
                                                .product!
                                                .description!
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment:
                                                    const Alignment(0.0, 0.2),
                                                child:
                                                    // Group: vuesax/bold/tag
                                                    SvgPicture.asset(
                                                  // tag
                                                  ImageAsset.price,
                                                ),
                                              ),
                                              Text(
                                                '${(double.parse(controller.cartModle.value.data![index].product!.price!) * (double.parse(controller.cartModle.value.data![index].quantity!))).toStringAsFixed(1)}'
                                                '\$',
                                                style: GoogleFonts.cairo(
                                                  fontSize: 18.0.sp,
                                                  color:
                                                      const Color(0xFF333333),
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.22.h,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.deleteMyCart(controller
                                            .cartModle
                                            .value
                                            .data![index]
                                            .productId!
                                            .toString());
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 5.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Delete',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: GoogleFonts.cairo(
                                                fontSize: 12.0.sp,
                                                color: const Color(0xFF333333),
                                                fontWeight: FontWeight.w600,
                                                height: 1.83.h,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                                ImageAsset.twotonebag),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.removeQuantity(
                                                index,
                                                controller.cartModle.value
                                                    .data![index].productId
                                                    .toString());
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(5.r),
                                            child: Icon(
                                              Icons.remove_circle,
                                              color: AppColor.maincolor
                                                  .withOpacity(0.7),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          controller.cartModle.value
                                              .data![index].quantity!,
                                          style: GoogleFonts.cairo(
                                            fontSize: 16.0.sp,
                                            color: const Color(0xFF333333),
                                            fontWeight: FontWeight.w600,
                                            height: 1.38.h,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.addQuantity(
                                                index,
                                                controller.cartModle.value
                                                    .data![index].productId
                                                    .toString());
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(5.r),
                                            child: const Icon(
                                              Icons.add_circle,
                                              color: AppColor.maincolor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
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
