import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../controller/password/changepasswordcontroller.dart';
import '../widget/buttoncustom.dart';
import '../widget/edittextfildcustom.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordController());

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: WillPopScope(
              onWillPop: alertexitapp,
              child: GetBuilder<ChangePasswordController>(
                  builder: (controller) => Container(
                      padding: EdgeInsets.symmetric(vertical: 50.h),
                      width: double.infinity,
                      height: Get.height,
                      child: ListView(children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25.w),
                          child: Text(
                            'Change Password',
                            style: GoogleFonts.cairo(
                              fontSize: 22.0,
                              color: const Color(0xFF333333),
                              fontWeight: FontWeight.w700,
                              height: 1.45,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Column(
                          children: [
                            Form(
                              key: controller.key,
                              child: Column(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 20,
                                          color: Colors.black.withOpacity(.1),
                                        )
                                      ],
                                    ),
                                    child: EditTextFild(
                                      onTap: () {},
                                      obscure: controller.isshowpassword,
                                      enabled: true,
                                      widget: InkWell(
                                        onTap: () {
                                          controller.isshow();
                                        },
                                        child: SvgPicture.string(
                                          // key
                                          '<svg viewBox="0.0 0.0 21.0 21.0" ><path transform="translate(1.75, 1.76)" d="M 9.618513107299805 0.1207500398159027 C 11.70101356506348 -0.2817499935626984 13.9497652053833 0.321999728679657 15.56851577758789 1.932000041007996 C 18.14976692199707 4.513250350952148 18.14976692199707 8.722001075744629 15.56851577758789 11.29450035095215 C 13.76601505279541 13.08825016021729 11.18476390838623 13.63950157165527 8.918513298034668 12.93075180053711 L 4.797264575958252 17.04325103759766 C 4.499764442443848 17.34950256347656 3.913514137268066 17.53325271606445 3.493514060974121 17.47200012207031 L 1.586014151573181 17.20950126647949 C 0.9560141563415527 17.12199974060059 0.3697641789913177 16.52700233459473 0.2735142111778259 15.89700126647949 L 0.01101424172520638 13.98950099945068 C -0.05023575574159622 13.56950092315674 0.1510142683982849 12.98325061798096 0.4397642612457275 12.68575096130371 L 1.419764041900635 11.70575046539307 L 4.543514728546143 8.581999778747559 C 3.843514442443848 6.306999683380127 4.386013984680176 3.725749969482422 6.188514232635498 1.932000041007996" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(6.03, 15.3)" d="M 0 0 L 2.012499809265137 2.012501001358032" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(11.38, 7.0)" d="M 1.3125 2.625 C 0.5876262187957764 2.625 0 2.037373781204224 0 1.3125 C 0 0.5876262784004211 0.5876262187957764 0 1.3125 0 C 2.037373781204224 0 2.625 0.5876262784004211 2.625 1.3125 C 2.625 2.037373781204224 2.037373781204224 2.625 1.3125 2.625 Z" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path  d="M 21 0 L 21 21 L 0 21 L 0 0 L 21 0 Z" fill="none" fill-opacity="0.0" stroke="none" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                          width: 21.0,
                                          height: 21.0,
                                          color: controller.passwordicon,
                                        ),
                                      ),
                                      text: 'Enter your old password',
                                      textInputAction: TextInputAction.done,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      mycontroller: controller.oldpassword,
                                      valid: (val) {
                                        return vlidetorinput(
                                            val!, 15, 5, 'name');
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 20,
                                          color: Colors.black.withOpacity(.1),
                                        )
                                      ],
                                    ),
                                    child: EditTextFild(
                                      obscure: controller.isshowpassword2,
                                      onTap: () {},
                                      enabled: true,
                                      widget: InkWell(
                                        onTap: () {
                                          controller.isshow2();
                                        },
                                        child: SvgPicture.string(
                                          // key
                                          '<svg viewBox="0.0 0.0 21.0 21.0" ><path transform="translate(1.75, 1.76)" d="M 9.618513107299805 0.1207500398159027 C 11.70101356506348 -0.2817499935626984 13.9497652053833 0.321999728679657 15.56851577758789 1.932000041007996 C 18.14976692199707 4.513250350952148 18.14976692199707 8.722001075744629 15.56851577758789 11.29450035095215 C 13.76601505279541 13.08825016021729 11.18476390838623 13.63950157165527 8.918513298034668 12.93075180053711 L 4.797264575958252 17.04325103759766 C 4.499764442443848 17.34950256347656 3.913514137268066 17.53325271606445 3.493514060974121 17.47200012207031 L 1.586014151573181 17.20950126647949 C 0.9560141563415527 17.12199974060059 0.3697641789913177 16.52700233459473 0.2735142111778259 15.89700126647949 L 0.01101424172520638 13.98950099945068 C -0.05023575574159622 13.56950092315674 0.1510142683982849 12.98325061798096 0.4397642612457275 12.68575096130371 L 1.419764041900635 11.70575046539307 L 4.543514728546143 8.581999778747559 C 3.843514442443848 6.306999683380127 4.386013984680176 3.725749969482422 6.188514232635498 1.932000041007996" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(6.03, 15.3)" d="M 0 0 L 2.012499809265137 2.012501001358032" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(11.38, 7.0)" d="M 1.3125 2.625 C 0.5876262187957764 2.625 0 2.037373781204224 0 1.3125 C 0 0.5876262784004211 0.5876262187957764 0 1.3125 0 C 2.037373781204224 0 2.625 0.5876262784004211 2.625 1.3125 C 2.625 2.037373781204224 2.037373781204224 2.625 1.3125 2.625 Z" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path  d="M 21 0 L 21 21 L 0 21 L 0 0 L 21 0 Z" fill="none" fill-opacity="0.0" stroke="none" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                          width: 21.0,
                                          height: 21.0,
                                          color: controller.passwordicon2,
                                        ),
                                      ),
                                      text: 'Enter the new password',
                                      textInputAction: TextInputAction.done,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      mycontroller: controller.password,
                                      valid: (val) {
                                        return vlidetorinput(
                                            val!, 15, 5, 'name');
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 20,
                                          color: Colors.black.withOpacity(.1),
                                        )
                                      ],
                                    ),
                                    child: EditTextFild(
                                      obscure: controller.isshowpassword3,
                                      onTap: () {},
                                      enabled: true,
                                      widget: InkWell(
                                        onTap: () {
                                          controller.isshow3();
                                        },
                                        child: SvgPicture.string(
                                          // key
                                          '<svg viewBox="0.0 0.0 21.0 21.0" ><path transform="translate(1.75, 1.76)" d="M 9.618513107299805 0.1207500398159027 C 11.70101356506348 -0.2817499935626984 13.9497652053833 0.321999728679657 15.56851577758789 1.932000041007996 C 18.14976692199707 4.513250350952148 18.14976692199707 8.722001075744629 15.56851577758789 11.29450035095215 C 13.76601505279541 13.08825016021729 11.18476390838623 13.63950157165527 8.918513298034668 12.93075180053711 L 4.797264575958252 17.04325103759766 C 4.499764442443848 17.34950256347656 3.913514137268066 17.53325271606445 3.493514060974121 17.47200012207031 L 1.586014151573181 17.20950126647949 C 0.9560141563415527 17.12199974060059 0.3697641789913177 16.52700233459473 0.2735142111778259 15.89700126647949 L 0.01101424172520638 13.98950099945068 C -0.05023575574159622 13.56950092315674 0.1510142683982849 12.98325061798096 0.4397642612457275 12.68575096130371 L 1.419764041900635 11.70575046539307 L 4.543514728546143 8.581999778747559 C 3.843514442443848 6.306999683380127 4.386013984680176 3.725749969482422 6.188514232635498 1.932000041007996" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(6.03, 15.3)" d="M 0 0 L 2.012499809265137 2.012501001358032" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(11.38, 7.0)" d="M 1.3125 2.625 C 0.5876262187957764 2.625 0 2.037373781204224 0 1.3125 C 0 0.5876262784004211 0.5876262187957764 0 1.3125 0 C 2.037373781204224 0 2.625 0.5876262784004211 2.625 1.3125 C 2.625 2.037373781204224 2.037373781204224 2.625 1.3125 2.625 Z" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path  d="M 21 0 L 21 21 L 0 21 L 0 0 L 21 0 Z" fill="none" fill-opacity="0.0" stroke="none" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                          width: 21.0,
                                          height: 21.0,
                                          color: controller.passwordicon3,
                                        ),
                                      ),
                                      text: 'Re-type the password again',
                                      textInputAction: TextInputAction.done,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      mycontroller: controller.againnewpassword,
                                      valid: (val) {
                                        return vlidetorinput(
                                            val!, 15, 5, 'name');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 200.h,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 25.w),
                              child: ButtonCustom(
                                onTap: () {
                                  controller.getChangePassword();
                                },
                                text: 'Done',
                              ),
                            )
                          ],
                        )
                      ])))),
        ));
  }
}
