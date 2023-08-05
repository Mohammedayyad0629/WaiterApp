import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/auth/logincontroller.dart';
import '../../../core/constant/color.dart';

class LoginRememberMe extends GetView<LogInController> {
  const LoginRememberMe({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
        builder: (controller) => Container(
            margin: EdgeInsets.symmetric(horizontal: 20.h),
            child: Row(
              children: [
                Checkbox(
                  splashRadius: 12,
                  activeColor: AppColor.maincolor,
                  value: controller.isremember,
                  onChanged: (val) {
                    controller.rememberMe(val!);
                  },
                ),
                Text('Remember me',
                    style:
                        TextStyle(color: AppColor.textcolor, fontSize: 13.sp)),
              ],
            )));
  }
}
