import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/cartcontroller.dart';
import '../../controller/home/homepagecontroller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class AppBarCustom extends GetView<HomepageController> {
  final Widget childLeading;
  final Function() onTapLeading;
  final String title;
  final bool isCart;
  final bool backgroundColor;
  final Widget? actionItemOne;

  const AppBarCustom({
    super.key,
    required this.childLeading,
    required this.backgroundColor,
    required this.onTapLeading,
    required this.title,
    required this.isCart,
    this.actionItemOne,
  });

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
      height: 100,
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
          child: InkWell(
              onTap: onTapLeading,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: backgroundColor == true
                        ? AppColor.maincoloroff.withOpacity(0.03)
                        : Colors.transparent,
                  ),
                  child: childLeading)),
        ),
        title: Text(
          title,
          style: GoogleFonts.cairo(
            fontSize: 18.0.sp,
            color: const Color(0xFF333333),
            fontWeight: FontWeight.w700,
            height: 1.44.h,
          ),
        ),
        actions: [
          Container(child: actionItemOne),
          isCart == true
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Obx(
                    () => cartController.cartModle.value.status == null
                        ? const Center(
                            child: CircularProgressIndicator(
                            strokeWidth: 1,
                          ))
                        : Stack(
                            children: [
                              Center(
                                child: SvgPicture.asset(
                                  ImageAsset.twotonebag,
                                  // color: AppColor.maincolor,
                                ),
                              ),
                              Positioned(
                                  bottom: 10,
                                  right: 0,
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.w, vertical: 1),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.red),
                                      child: Text(
                                        cartController
                                            .cartModle.value.data!.length
                                            .toString(),
                                        style: GoogleFonts.cairo(
                                          fontSize: 9.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          height: 1.1,
                                        ),
                                      )))
                            ],
                          ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
