import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/logincontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../textfildcustom.dart';

class LoginForm extends GetView<LogInController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.key,
        child: Column(
          children: [
            TextFildCustom(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              hinttext: '9'.tr,
              icon: Icons.email_outlined,
              mycontroller: controller.email,
              valid: (val) {
                return vlidetorinput(val!, 50, 5, 'email');
              },
              color: AppColor.iconcolor,
            ),
            GetBuilder<LogInController>(
                builder: (controller) => TextFildCustom(
                      obscure: controller.isshowpassword,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      hinttext: 'Password',
                      icon: controller.eyeicon,
                      mycontroller: controller.password,
                      valid: (val) {
                        return vlidetorinput(val!, 50, 6, 'password');
                      },
                      color: controller.passwordicon,
                      onPressed: () {
                        controller.isshow();
                      },
                    )),
          ],
        ));
  }
}
