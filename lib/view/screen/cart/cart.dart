import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/cartcontroller.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/nameroutes.dart';
import '../../widget/buttonfilecustom.dart';
import '../../widget/cart/obxcartview.dart';
import '../../widget/cart/titlecart.dart';

// ignore: must_be_immutable
class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>();

    return Scaffold(
      body: GetBuilder<CartController>(
          builder: (controller) => Stack(children: [
                Positioned(
                    top: -120.w,
                    left: 0,
                    child: SvgPicture.asset(
                      ImageAsset.pattern,
                      // color: AppColor.maincolor,
                      // width: double.infinity,
                    )),
                Container(
                    margin: EdgeInsets.only(
                      left: 20.h,
                      right: 20.h,
                    ),
                    height: double.infinity,
                    child: Column(
                        // physics: const NeverScrollableScrollPhysics(),

                        children: [
                          const TitleCart(),
                          SizedBox(
                            height: 10.h,
                          ),
                          const ObxCartView(),
                          Text(
                            'Total: \$${controller.totalPrice.toStringAsFixed(2)}',
                            style: GoogleFonts.cairo(
                              fontSize: 16.0.sp,
                              color: const Color(0xFF333333),
                              fontWeight: FontWeight.w700,
                              height: 1.63.h,
                            ),
                          ),
                          ButtonFileCustom(
                              onTap: () {
                                Get.toNamed(
                                  NameRoutes.paymentorder,
                                );
                              },
                              text: 'Confirm Order')
                        ])),
              ])),
    );
  }
}
