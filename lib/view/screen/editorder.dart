import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/cartcontroller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/nameroutes.dart';

class EditOrder extends StatelessWidget {
  const EditOrder({super.key});

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
        Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey[200]),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColor.maincolor,
                          )),
                    ),
                    Text(
                      'Order Edit',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.cairo(
                        fontSize: 18.0,
                        color: const Color(0xFF333333),
                        fontWeight: FontWeight.w700,
                        height: 1.44,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Order Summary :',
                  style: GoogleFonts.cairo(
                    fontSize: 16.0,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w700,
                    height: 1.44,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Name Meal :',
                        style: GoogleFonts.cairo(
                          fontSize: 14.0,
                          color: const Color(0xFFED771C),
                          fontWeight: FontWeight.w700,
                          height: 1.57,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Price:',
                            style: GoogleFonts.cairo(
                              fontSize: 14.0,
                              color: const Color(0xFFED771C),
                              fontWeight: FontWeight.w700,
                              height: 1.57,
                            ),
                          ),
                          Text(
                            'Quantity:',
                            style: GoogleFonts.cairo(
                              fontSize: 14.0,
                              color: const Color(0xFFED771C),
                              fontWeight: FontWeight.w700,
                              height: 1.57,
                            ),
                          ),
                          Text(
                            'Totle:',
                            style: GoogleFonts.cairo(
                              fontSize: 14.0,
                              color: const Color(0xFFED771C),
                              fontWeight: FontWeight.w700,
                              height: 1.57,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: Obx(() => SizedBox(
                        width: double.infinity,
                        child: controller.cartModle.value.data == null
                            ? const Center(child: CircularProgressIndicator())
                            : controller.cartModle.value.data!.isEmpty
                                ? const Text('No find data')
                                : Container(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: ListView.separated(
                                      // physics:NeverScrollableScrollPhysics(),
                                      itemCount: controller
                                          .cartModle.value.data!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      controller.deleteMyCart(
                                                          controller
                                                              .cartModle
                                                              .value
                                                              .data![index]
                                                              .productId!
                                                              .toString());
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(5.r),
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: Colors.grey[300],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: controller
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
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: GoogleFonts
                                                                .cairo(
                                                              fontSize: 14.0.sp,
                                                              color: const Color(
                                                                  0xFF333333),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
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
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: GoogleFonts
                                                                .cairo(
                                                              fontSize: 14.0.sp,
                                                              color: const Color(
                                                                  0xFF333333),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              height: 1.57.h,
                                                            ),
                                                          ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    '${double.parse(controller.cartModle.value.data![index].product!.price!).toStringAsFixed(1)}'
                                                    '\$',
                                                    style: GoogleFonts.cairo(
                                                      fontSize: 13.0,
                                                      color: const Color(
                                                          0xFF333333),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.69,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .removeQuantity(
                                                                  index,
                                                                  controller
                                                                      .cartModle
                                                                      .value
                                                                      .data![
                                                                          index]
                                                                      .productId
                                                                      .toString());
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.r),
                                                          child: Icon(
                                                            Icons.remove_circle,
                                                            color: AppColor
                                                                .maincolor
                                                                .withOpacity(
                                                                    0.7),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        controller
                                                            .cartModle
                                                            .value
                                                            .data![index]
                                                            .quantity!,
                                                        style:
                                                            GoogleFonts.cairo(
                                                          fontSize: 13.0,
                                                          color: const Color(
                                                              0xFF333333),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height: 1.69,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          controller.addQuantity(
                                                              index,
                                                              controller
                                                                  .cartModle
                                                                  .value
                                                                  .data![index]
                                                                  .productId
                                                                  .toString());
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.r),
                                                          child: const Icon(
                                                            Icons.add_circle,
                                                            color: AppColor
                                                                .maincolor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    '${(double.parse(controller.cartModle.value.data![index].product!.price!) * (double.parse(controller.cartModle.value.data![index].quantity!))).toStringAsFixed(1)}'
                                                    '\$',
                                                    style: GoogleFonts.cairo(
                                                      fontSize: 13.0,
                                                      color: const Color(
                                                          0xFF333333),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.69,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const Divider(
                                          height: 3,
                                          thickness: 1,
                                          color: AppColor.maincoloroff,
                                        );
                                      },
                                    ),
                                  )))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Total: \$${controller.totalPrice.toStringAsFixed(2)}',
                      style: GoogleFonts.cairo(
                        fontSize: 16.0,
                        color: const Color(0xFF333333),
                        fontWeight: FontWeight.w700,
                        height: 1.63,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(
                          NameRoutes.home,
                        );
                      },
                      child: Container(
                          margin: EdgeInsets.only(bottom: 5.h),
                          alignment: const Alignment(-0.02, 0.04),
                          height: 53.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                            border: Border.all(color: AppColor.maincolor),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xFF707070).withOpacity(0.27),
                                offset: const Offset(1.0, 1.0),
                                blurRadius: 20.0,
                              ),
                            ],
                          ),
                          child: // Group: Group 45675

                              SizedBox(
                            width: 151.5,
                            height: 30.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Add a New Meal',
                                  style: GoogleFonts.cairo(
                                    fontSize: 16.0,
                                    color: const Color(0xFFED771C),
                                    fontWeight: FontWeight.w700,
                                    height: 1.63,
                                  ),
                                ),
                                Icon(
                                  Icons.add_box,
                                  color: AppColor.maincoloroff.withOpacity(0.5),
                                )
                              ],
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(
                          NameRoutes.orderdone,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15.h),
                        alignment: const Alignment(-0.02, 0.04),
                        height: 53.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: AppColor.textcolor,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF707070).withOpacity(0.27),
                              offset: const Offset(1.0, 1.0),
                              blurRadius: 20.0,
                            ),
                          ],
                        ),
                        child: Text(
                          'Confirm Order',
                          style: GoogleFonts.cairo(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            height: 1.63,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ]);
    }));
  }
}
