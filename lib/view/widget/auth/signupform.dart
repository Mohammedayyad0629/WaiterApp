import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signupcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../textfildcustom.dart';

class SignupForm extends GetView<SignUpController> {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.key,
        child: Column(
          children: [
            TextFildCustom(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              hinttext: '10'.tr,
              icon: Icons.person_outline,
              mycontroller: controller.name,
              valid: (val) {
                return vlidetorinput(val!, 15, 5, 'username');
              },
              color: AppColor.iconcolor,
            ),
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
            TextFildCustom(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              hinttext: '19'.tr,
              icon: Icons.phone_android,
              mycontroller: controller.mobile,
              valid: (val) {
                return vlidetorinput(val!, 20, 5, 'phone');
              },
              color: AppColor.iconcolor,
            ),
            GetBuilder<SignUpController>(
              builder: (controller) => TextFildCustom(
                obscure: controller.isshowpassword,
                textInputAction: TextInputAction.next,
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
              ),
            ),
            GetBuilder<SignUpController>(
              builder: (controller) => TextFildCustom(
                obscure: controller.isshowpassword2,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                hinttext: 'Password Again',
                icon: controller.eyeicon2,
                mycontroller: controller.againnewpassword,
                valid: (val) {
                  return vlidetorinput(val!, 50, 6, 'password');
                },
                color: controller.passwordicon2,
                onPressed: () {
                  controller.isshow2();
                },
              ),
            ),
          ],
        ));
  }
}
