import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/auth/signupcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/nameroutes.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../iconandtitle.dart';
import '../../widget/auth/signupform.dart';
import '../../widget/buttoncustom.dart';
import '../../widget/textbuttoncustom.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: WillPopScope(
              onWillPop: alertexitapp,
              child: GetBuilder<SignUpController>(
                builder: (controller) => Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 1.h),
                  color: AppColor.backgrond,
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      const IconAndTitle(),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '8'.tr,
                          style: TextStyle(fontSize: 20.sp),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const SignupForm(),
                      SizedBox(
                        height: 15.h,
                      ),
                      ButtonCustom(
                        text: 'Signup',
                        onTap: () {
                          controller.signup();
                        },
                      ),
                      TextButtonCustom(
                        data: '16'.tr,
                        onPressed: () {
                          Get.offNamed(NameRoutes.login);
                        },
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
