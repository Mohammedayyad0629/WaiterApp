import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/cartcontroller.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/nameroutes.dart';

class OrderDone extends StatelessWidget {
  const OrderDone({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>();

    return Scaffold(body: GetBuilder<CartController>(builder: (controller) {
      return Stack(children: [
        Positioned(
            top: -120.w,
            left: 0,
            child: SvgPicture.asset(
              ImageAsset.pattern,
              // color: AppColor.maincolor,
              // width: double.infinity,
            )),
        Positioned(
            top: 0.w,
            left: 0,
            child: SvgPicture.asset(
              ImageAsset.group,
              // color: AppColor.maincolor,
              // width: double.infinity,
            )),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ImageAsset.done,
                // color: AppColor.maincolor,
                // width: double.infinity,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Thank you for trusting us',
                style: GoogleFonts.cairo(
                  fontSize: 22.0,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w700,
                  height: 1.18,
                ),
                textAlign: TextAlign.right,
              ),
              // Group: Group 506
              SizedBox(height: 20.h),
              Text(
                'Order Number : 12',
                style: GoogleFonts.cairo(
                  fontSize: 18.0,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w600,
                  height: 1.44,
                ),
                textAlign: TextAlign.right,
              ),
              // Group: Group 507
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Timing of the Order : 10:00am',
                style: GoogleFonts.cairo(
                  fontSize: 18.0,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w600,
                  height: 1.44,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: 50.h,
              ),

              InkWell(
                onTap: () {
                  Get.toNamed(
                    NameRoutes.home,
                  );
                },
                child: Text(
                  'Go to the Home Page',
                  style: GoogleFonts.cairo(
                    fontSize: 16.0,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w700,
                    height: 1.63,
                  ),
                ),
              ),
            ],
          ),
        )
      ]);
    }));
  }
}
