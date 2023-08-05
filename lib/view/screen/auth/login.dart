import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/auth/logincontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/nameroutes.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../iconandtitle.dart';
import '../../widget/auth/loginform.dart';
import '../../widget/auth/loginrememberme.dart';
import '../../widget/buttoncustom.dart';
import '../../widget/textbuttoncustom.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogInController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: WillPopScope(
              onWillPop: alertexitapp,
              child: GetBuilder<LogInController>(
                builder: (controller) => Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 2.h),
                  color: AppColor.backgrond,
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      const IconAndTitle(),
                      SizedBox(
                        height: 40.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '20'.tr,
                          style: TextStyle(fontSize: 20.sp),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      const LoginForm(),
                      InkWell(
                        onTap: () {
                          controller.forgetpassword();
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: 20.w),
                            padding: EdgeInsets.all(1.r),
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            child: Text(
                              '15'.tr,
                              style: TextStyle(fontSize: 10.sp),
                            )),
                      ),
                      const LoginRememberMe(),
                      SizedBox(
                        height: 20.h,
                      ),
                      ButtonCustom(
                        text: 'Login',
                        onTap: () {
                          controller.login();
                        },
                      ),
                      TextButtonCustom(
                        data: '16'.tr,
                        onPressed: () {
                          Get.offNamed(NameRoutes.signup);
                        },
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
