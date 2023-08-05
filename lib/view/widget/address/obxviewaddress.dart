import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/address/addressviewcontroller.dart';
import '../../../core/constant/imageasset.dart';

class ObxViewAddress extends GetView<AddressViewController> {
  const ObxViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => Container(
          child: controller.addressModle.value.data == null
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: ListView.separated(
                    // physics:NeverScrollableScrollPhysics(),
                    itemCount: controller.addressModle.value.data!.length,

                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          //
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
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
                                      borderRadius: BorderRadius.circular(10.r),
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
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.addressModle.value
                                              .data![index].name
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
                                          controller.addressModle.value
                                              .data![index].address
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: GoogleFonts.cairo(
                                            fontSize: 14.0.sp,
                                            color: const Color(0xFF333333)
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.w600,
                                            height: 1.83.h,
                                          ),
                                        ),
                                        Text(
                                          controller.addressModle.value
                                              .data![index].mobile
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: GoogleFonts.cairo(
                                            fontSize: 10.0.sp,
                                            color: const Color(0xFF333333)
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.w600,
                                            height: 1.4.h,
                                          ),
                                        ),
                                        // Group: Group 477
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // Group: Group 479
                                InkWell(
                                  onTap: () {
                                    controller.deleteAddress(controller
                                        .addressModle.value.data![index].id
                                        .toString());
                                  },
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
                                      SvgPicture.asset(ImageAsset.twotonebag),
                                    ],
                                  ),
                                ),
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
