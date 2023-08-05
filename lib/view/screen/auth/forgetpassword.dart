import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../../iconandtitle.dart';
import '../../widget/buttoncustom.dart';
import '../../widget/textfildcustom.dart';
import '../../../controller/auth/forgetpasswordcontroller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: GetBuilder<ForgetPasswordController>(
              builder: (controller) => HandlingNoDataView(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      color: AppColor.backgrond,
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 20.h),
                      height: double.infinity,
                      width: double.infinity,
                      child: ListView(
                        children: [
                          const IconAndTitle(),
                          SizedBox(
                            height: 50.h,
                          ),
                          Form(
                            key: controller.key,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '21'.tr,
                                  textAlign: TextAlign.start,
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '22'.tr,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                TextFildCustom(
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.emailAddress,
                                  hinttext: '9'.tr,
                                  icon: Icons.email_outlined,
                                  color: AppColor.iconcolor,
                                  mycontroller: controller.email,
                                  valid: (val) {
                                    return vlidetorinput(val!, 50, 5, 'email');
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          ButtonCustom(
                            text: 'Send verification code',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ))),
    );
  }
}
