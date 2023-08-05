import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/cartcontroller.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/nameroutes.dart';
import '../widget/buttonfilecustom.dart';

class PaymentOrder extends StatelessWidget {
  const PaymentOrder({super.key});

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Payment Method : ',
                          style: GoogleFonts.cairo(
                            fontSize: 16.0,
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.w700,
                            height: 1.63,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: controller.selectedOption ==
                                          controller.select[0]
                                      ? Colors.greenAccent.withOpacity(0.5)
                                      : Colors.grey[300],
                                ),
                                child: RadioListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Pay Cash',
                                        style: GoogleFonts.cairo(
                                          fontSize: 14.0,
                                          color: const Color(0xFF333333)
                                              .withOpacity(0.8),
                                          fontWeight: FontWeight.w700,
                                          height: 1.63,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              gradient:
                                                  controller.selectedOption ==
                                                          controller.select[0]
                                                      ? LinearGradient(colors: [
                                                          Colors.green.shade300,
                                                          Colors.greenAccent
                                                        ])
                                                      : null),
                                          child: controller.selectedOption ==
                                                  controller.select[0]
                                              ? const Icon(
                                                  Icons.attach_money,
                                                  color: Colors.white,
                                                )
                                              : const Icon(Icons.attach_money)),
                                    ],
                                  ),
                                  activeColor: Colors.green,
                                  value: controller.select[0],
                                  groupValue: controller.selectedOption,
                                  onChanged: (value) {
                                    controller.selectedOption = value!;
                                    controller.onChang(value);
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: controller.selectedOption ==
                                          controller.select[1]
                                      ? Colors.greenAccent.withOpacity(0.5)
                                      : Colors.grey[300],
                                ),
                                child: RadioListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Visa Payment',
                                        style: GoogleFonts.cairo(
                                          fontSize: 14.0,
                                          color: const Color(0xFF333333)
                                              .withOpacity(0.8),
                                          fontWeight: FontWeight.w700,
                                          height: 1.63,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              gradient:
                                                  controller.selectedOption ==
                                                          controller.select[1]
                                                      ? LinearGradient(colors: [
                                                          Colors.green.shade300,
                                                          Colors.greenAccent
                                                        ])
                                                      : null),
                                          child: controller.selectedOption ==
                                                  controller.select[1]
                                              ? const Icon(
                                                  Icons.credit_card,
                                                  color: Colors.white,
                                                )
                                              : const Icon(Icons.credit_card)),
                                    ],
                                  ),
                                  activeColor: Colors.green,
                                  value: controller.select[1],
                                  groupValue: controller.selectedOption,
                                  onChanged: (value) {
                                    controller.selectedOption = value!;
                                    controller.onChang(value);
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: controller.selectedOption ==
                                          controller.select[2]
                                      ? Colors.greenAccent.withOpacity(0.5)
                                      : Colors.grey[300],
                                ),
                                child: RadioListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Electronic Wallet',
                                          style: GoogleFonts.cairo(
                                            fontSize: 14.0,
                                            color: const Color(0xFF333333)
                                                .withOpacity(0.8),
                                            fontWeight: FontWeight.w700,
                                            height: 1.63,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                gradient: controller
                                                            .selectedOption ==
                                                        controller.select[2]
                                                    ? LinearGradient(colors: [
                                                        Colors.green.shade300,
                                                        Colors.greenAccent
                                                      ])
                                                    : null),
                                            child: controller.selectedOption ==
                                                    controller.select[2]
                                                ? const Icon(
                                                    Icons.wallet,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(Icons.wallet)),
                                      ],
                                    ),
                                    activeColor: Colors.green,
                                    value: controller.select[2],
                                    groupValue: controller.selectedOption,
                                    onChanged: (value) {
                                      controller.selectedOption = value!;
                                      controller.onChang(value);
                                    }),
                              ),
                            ],
                          ),
                        ),
                        ButtonFileCustom(
                            onTap: () {
                              Get.toNamed(
                                NameRoutes.order,
                              );
                            },
                            text: 'Confirm Order')
                      ],
                    )),
              ])),
    );
  }
}
