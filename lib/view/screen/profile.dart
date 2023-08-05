import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waiter/core/constant/color.dart';
import 'package:waiter/view/screen/select_photo_options_screen.dart';
import '../../controller/home/homepagecontroller.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/functions/validinput.dart';
import '../widget/edittextfildcustom.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  void showSelectPhotoOptions(BuildContext context) {
    HomepageController controller = Get.find<HomepageController>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: controller.pickImage,
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.find<HomepageController>();

    return Scaffold(
      body: GetBuilder<HomepageController>(
          builder: (controller) => Stack(children: [
                Positioned(
                    top: -120.w,
                    left: 0,
                    child: SvgPicture.asset(
                      ImageAsset.pattern,
                      // color: AppColor.maincolor,
                      // width: double.infinity,
                    )),
                Obx(
                  () => Container(
                      margin: EdgeInsets.only(
                        left: 20.h,
                        right: 20.h,
                      ),
                      height: double.infinity,
                      child: controller.profileModle.value.data == null
                          ? const Center(child: CircularProgressIndicator())
                          : ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 50.h),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Profile',
                                            style: GoogleFonts.cairo(
                                              fontSize: 18.0,
                                              color: const Color(0xFF333333),
                                              fontWeight: FontWeight.w700,
                                              height: 1.44,
                                            ),
                                          ),
                                          controller.enabled == true
                                              ? InkWell(
                                                  onTap: () {
                                                    controller
                                                        .getEditeProfileData();
                                                  },
                                                  child: Text(
                                                    'Save',
                                                    style: GoogleFonts.cairo(
                                                      fontSize: 13.0,
                                                      color: const Color(
                                                              0xFF333333)
                                                          .withOpacity(0.8),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.85,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 20, right: 20, top: 20),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100.r),
                                            child: CachedNetworkImage(
                                              imageUrl: controller.profileModle
                                                  .value.data!.photo
                                                  .toString(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                              height: 160.h,
                                              width: 160.w,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          left: Get.width / 2,
                                          child: InkWell(
                                            onTap: () {
                                              showSelectPhotoOptions(context);
                                            },
                                            child: Container(
                                              width: 40,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w,
                                                  vertical: 10.h),
                                              decoration: BoxDecoration(
                                                  color: AppColor.maincolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          35)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.string(
                                                    // Path 17363
                                                    '<svg viewBox="3.4 1.67 14.28 14.23" ><path transform="translate(-0.59, -0.38)" d="M 4.892083168029785 16.28678894042969 L 4.972412586212158 16.28678894042969 L 8.69428825378418 15.94762325286865 C 9.101996421813965 15.90701103210449 9.483322143554688 15.72737789154053 9.774257659912109 15.43887901306152 L 17.80708885192871 7.406052589416504 C 18.45622253417969 6.720283985137939 18.42827987670898 5.638623714447021 17.74460983276367 4.987278938293457 L 15.29905700683594 2.541728734970093 C 14.63833427429199 1.921107411384583 13.61736297607422 1.89423942565918 12.9249095916748 2.479251623153687 L 4.892083168029785 10.51207828521729 C 4.603586196899414 10.80301189422607 4.423953056335449 11.18433856964111 4.38333797454834 11.5920467376709 L 3.999547719955444 15.31392288208008 C 3.975204944610596 15.57859992980957 4.070091724395752 15.84035396575928 4.258382797241211 16.02795219421387 C 4.426820755004883 16.19502258300781 4.654844760894775 16.28816032409668 4.892083168029785 16.28678894042969 Z M 14.05843162536621 3.791279315948486 L 16.49505805969238 6.227903842926025 L 14.70998287200928 7.968349933624268 L 12.31798648834229 5.576352596282959 L 14.05843162536621 3.791279315948486 Z M 6.114859104156494 11.74377727508545 L 11.13983821868896 6.754500389099121 L 13.54968547821045 9.164348602294922 L 8.551483154296875 14.16255283355713 L 5.873873710632324 14.41246128082275 L 6.114859104156494 11.74377727508545 Z" fill="#e7e7e7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                  ),
                                                  SvgPicture.string(
                                                    // Path 17362
                                                    '<svg viewBox="3.41 17.69 14.28 1.79" ><path transform="translate(-0.59, -2.31)" d="M 17.3880443572998 20 L 4.892536163330078 20 C 4.399601936340332 20 4 20.39960098266602 4 20.89253616333008 C 4 21.38546943664551 4.399601936340332 21.78507614135742 4.892536163330078 21.78507614135742 L 17.3880443572998 21.78507614135742 C 17.8809814453125 21.78507614135742 18.28058433532715 21.38546943664551 18.28058433532715 20.89253616333008 C 18.28058433532715 20.39960098266602 17.8809814453125 20 17.3880443572998 20 Z" fill="#e7e7e7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                  Text(
                                    controller.profileModle.value.data!.name
                                        .toString(),
                                    style: GoogleFonts.cairo(
                                      fontSize: 18.0,
                                      color: const Color(0xFF2B2A2A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Personal Data :',
                                        style: GoogleFonts.cairo(
                                          fontSize: 15.0,
                                          color: const Color(0xFF333333)
                                              .withOpacity(0.8),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.changeenabled();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w),
                                          color: const Color(0xFFE7E7E7)
                                              .withOpacity(0.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SvgPicture.string(
                                                // Path 17363
                                                '<svg viewBox="3.4 1.67 14.28 14.23" ><path transform="translate(-0.59, -0.38)" d="M 4.892083168029785 16.28678894042969 L 4.972412586212158 16.28678894042969 L 8.69428825378418 15.94762325286865 C 9.101996421813965 15.90701103210449 9.483322143554688 15.72737789154053 9.774257659912109 15.43887901306152 L 17.80708885192871 7.406052589416504 C 18.45622253417969 6.720283985137939 18.42827987670898 5.638623714447021 17.74460983276367 4.987278938293457 L 15.29905700683594 2.541728734970093 C 14.63833427429199 1.921107411384583 13.61736297607422 1.89423942565918 12.9249095916748 2.479251623153687 L 4.892083168029785 10.51207828521729 C 4.603586196899414 10.80301189422607 4.423953056335449 11.18433856964111 4.38333797454834 11.5920467376709 L 3.999547719955444 15.31392288208008 C 3.975204944610596 15.57859992980957 4.070091724395752 15.84035396575928 4.258382797241211 16.02795219421387 C 4.426820755004883 16.19502258300781 4.654844760894775 16.28816032409668 4.892083168029785 16.28678894042969 Z M 14.05843162536621 3.791279315948486 L 16.49505805969238 6.227903842926025 L 14.70998287200928 7.968349933624268 L 12.31798648834229 5.576352596282959 L 14.05843162536621 3.791279315948486 Z M 6.114859104156494 11.74377727508545 L 11.13983821868896 6.754500389099121 L 13.54968547821045 9.164348602294922 L 8.551483154296875 14.16255283355713 L 5.873873710632324 14.41246128082275 L 6.114859104156494 11.74377727508545 Z" fill="#e7e7e7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                color:
                                                    controller.enabled == true
                                                        ? AppColor.maincolor
                                                            .withOpacity(0.5)
                                                        : Colors.black
                                                            .withOpacity(0.5),
                                              ),
                                              SvgPicture.string(
                                                // Path 17362
                                                '<svg viewBox="3.41 17.69 14.28 1.79" ><path transform="translate(-0.59, -2.31)" d="M 17.3880443572998 20 L 4.892536163330078 20 C 4.399601936340332 20 4 20.39960098266602 4 20.89253616333008 C 4 21.38546943664551 4.399601936340332 21.78507614135742 4.892536163330078 21.78507614135742 L 17.3880443572998 21.78507614135742 C 17.8809814453125 21.78507614135742 18.28058433532715 21.38546943664551 18.28058433532715 20.89253616333008 C 18.28058433532715 20.39960098266602 17.8809814453125 20 17.3880443572998 20 Z" fill="#e7e7e7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                color:
                                                    controller.enabled == true
                                                        ? AppColor.maincolor
                                                            .withOpacity(0.5)
                                                        : Colors.black
                                                            .withOpacity(0.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    // margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
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
                                    child: Column(
                                      children: [
                                        Form(
                                          key: controller.textKey,
                                          child: Column(
                                            children: [
                                              EditTextFild(
                                                widget: SvgPicture.string(
                                                  // profile
                                                  '<svg viewBox="0.0 0.0 22.0 22.0" ><path transform="translate(6.93, 1.83)" d="M 3.914166688919067 8.130833625793457 C 1.732499957084656 8.057499885559082 -2.490091119522718e-32 6.270000457763672 -2.490091119522718e-32 4.070000171661377 C -8.141635690383012e-16 1.824166655540466 1.815000057220459 0 4.070000171661377 0 C 6.315833568572998 0 8.14000129699707 1.824166655540466 8.14000129699707 4.070000171661377 C 8.130834579467773 6.270000457763672 6.398333549499512 8.057499885559082 4.216666698455811 8.130833625793457 C 4.125 8.12166690826416 4.015000343322754 8.12166690826416 3.914166688919067 8.130833625793457 Z" fill="none" fill-opacity="0.2" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.2" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(4.9, 12.09)" d="M 1.663750052452087 6.63895845413208 C 4.18458366394043 8.325624465942383 8.318751335144043 8.325624465942383 10.83958435058594 6.63895845413208 C 13.05791759490967 5.153958320617676 13.05791759490967 2.73395848274231 10.83958435058594 1.258125066757202 C 8.32791805267334 -0.4193750023841858 4.193749904632568 -0.4193750023841858 1.663750052452087 1.258125066757202 C -0.5545833706855774 2.743125200271606 -0.5545833706855774 5.163125038146973 1.663750052452087 6.63895845413208 Z" fill="none" fill-opacity="0.5" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.5" stroke-linecap="round" stroke-linejoin="round" /><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 22.0, 22.0)" d="M 22 0 L 22 22 L 0 22 L 0 0 L 22 0 Z" fill="none" fill-opacity="0.0" stroke="none" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                                  width: 22.0,
                                                  height: 22.0,
                                                ),
                                                text: controller.profileModle
                                                    .value.data!.name
                                                    .toString(),
                                                textInputAction:
                                                    TextInputAction.next,
                                                keyboardType:
                                                    TextInputType.name,
                                                mycontroller: controller.name,
                                                valid: (val) {
                                                  return vlidetorinput(
                                                      val!, 15, 5, 'name');
                                                },
                                                enabled: controller.enabled,
                                              ),
                                              const Divider(
                                                thickness: 1,
                                                height: 2,
                                              ),
                                              EditTextFild(
                                                enabled: controller.enabled,
                                                widget: SvgPicture.string(
                                                  // sms
                                                  '<svg viewBox="0.0 0.0 23.0 23.0" ><path transform="translate(1.92, 3.35)" d="M 19.16666603088379 9.084995269775391 L 19.16666603088379 11.5 C 19.16666603088379 14.85416603088379 17.25 16.29166603088379 14.375 16.29166603088379 L 4.791666507720947 16.29166603088379 C 1.916666626930237 16.29166603088379 0 14.85416603088379 0 11.5 L 0 4.791666507720947 C 0 1.4375 1.916666626930237 0 4.791666507720947 0 L 14.375 0 C 17.25 0 19.16666603088379 1.4375 19.16666603088379 4.791666507720947" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(6.71, 8.63)" d="M 9.583333015441895 0 L 6.583745002746582 2.395833253860474 C 5.596662044525146 3.181666612625122 3.977078199386597 3.181666612625122 2.989995241165161 2.395833253860474 L 0 0" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path  d="M 23 0 L 23 23 L 0 23 L 0 0 L 23 0 Z" fill="none" fill-opacity="0.0" stroke="none" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                                ),
                                                text: controller.profileModle
                                                    .value.data!.email
                                                    .toString(),
                                                textInputAction:
                                                    TextInputAction.next,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                mycontroller: controller.email,
                                                valid: (val) {
                                                  return vlidetorinput(
                                                      val!, 30, 5, 'email');
                                                },
                                              ),
                                              const Divider(
                                                thickness: 1,
                                                height: 2,
                                              ),
                                              EditTextFild(
                                                enabled: controller.enabled,
                                                widget: Icon(
                                                  Icons.phone_iphone,
                                                  size: 30.r,
                                                ),
                                                text: controller.profileModle
                                                    .value.data!.mobile
                                                    .toString(),
                                                textInputAction:
                                                    TextInputAction.next,
                                                keyboardType:
                                                    TextInputType.phone,
                                                mycontroller: controller.mobile,
                                                valid: (val) {
                                                  return vlidetorinput(
                                                      val!, 15, 5, 'phone');
                                                },
                                              ),
                                              const Divider(
                                                thickness: 1,
                                                height: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        EditTextFild(
                                          onTap: () {
                                            Get.toNamed(NameRoutes.viewaddress);
                                          },
                                          enabled: false,
                                          widget: SvgPicture.string(
                                            // location-tick
                                            '<svg viewBox="0.0 0.0 22.0 22.0" ><path transform="translate(3.1, 1.83)" d="M 15.58586025238037 5.958335876464844 C 16.6400260925293 10.6150016784668 13.74336051940918 14.55666923522949 11.20419406890869 16.99500274658203 C 9.361693382263184 18.77333641052246 6.446693420410156 18.77333641052246 4.595026969909668 16.99500274658203 C 2.065026760101318 14.55666923522949 -0.8316404223442078 10.6058349609375 0.2225262373685837 5.949168682098389 C 2.028359651565552 -1.989164590835571 13.78919315338135 -1.979997754096985 15.58586025238037 5.958335876464844 Z" fill="none" fill-opacity="0.5" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(8.48, 8.25)" d="M 0 2.291666746139526 L 1.375 3.666666746139526 L 5.041666984558105 0" fill="none" fill-opacity="0.2" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.2" stroke-linecap="round" stroke-linejoin="round" /><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 22.0, 22.0)" d="M 22 0 L 22 22 L 0 22 L 0 0 L 22 0 Z" fill="none" fill-opacity="0.0" stroke="none" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                          ),
                                          text: 'Addrees',
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.name,
                                          mycontroller: controller.addrees,
                                          valid: (val) {
                                            return vlidetorinput(
                                                val!, 15, 5, 'name');
                                          },
                                        ),
                                        const Divider(
                                          thickness: 1,
                                          height: 2,
                                        ),
                                        EditTextFild(
                                          onTap: () {
                                            if (controller.enabled == true) {
                                              Get.toNamed(
                                                  NameRoutes.changepassword);
                                              log('message');
                                            }
                                          },
                                          enabled: false,
                                          widget: SvgPicture.string(
                                            // key
                                            '<svg viewBox="0.0 0.0 21.0 21.0" ><path transform="translate(1.75, 1.76)" d="M 9.618513107299805 0.1207500398159027 C 11.70101356506348 -0.2817499935626984 13.9497652053833 0.321999728679657 15.56851577758789 1.932000041007996 C 18.14976692199707 4.513250350952148 18.14976692199707 8.722001075744629 15.56851577758789 11.29450035095215 C 13.76601505279541 13.08825016021729 11.18476390838623 13.63950157165527 8.918513298034668 12.93075180053711 L 4.797264575958252 17.04325103759766 C 4.499764442443848 17.34950256347656 3.913514137268066 17.53325271606445 3.493514060974121 17.47200012207031 L 1.586014151573181 17.20950126647949 C 0.9560141563415527 17.12199974060059 0.3697641789913177 16.52700233459473 0.2735142111778259 15.89700126647949 L 0.01101424172520638 13.98950099945068 C -0.05023575574159622 13.56950092315674 0.1510142683982849 12.98325061798096 0.4397642612457275 12.68575096130371 L 1.419764041900635 11.70575046539307 L 4.543514728546143 8.581999778747559 C 3.843514442443848 6.306999683380127 4.386013984680176 3.725749969482422 6.188514232635498 1.932000041007996" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(6.03, 15.3)" d="M 0 0 L 2.012499809265137 2.012501001358032" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(11.38, 7.0)" d="M 1.3125 2.625 C 0.5876262187957764 2.625 0 2.037373781204224 0 1.3125 C 0 0.5876262784004211 0.5876262187957764 0 1.3125 0 C 2.037373781204224 0 2.625 0.5876262784004211 2.625 1.3125 C 2.625 2.037373781204224 2.037373781204224 2.625 1.3125 2.625 Z" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path  d="M 21 0 L 21 21 L 0 21 L 0 0 L 21 0 Z" fill="none" fill-opacity="0.0" stroke="none" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                            width: 21.0,
                                            height: 21.0,
                                          ),
                                          text: 'Password',
                                          textInputAction: TextInputAction.done,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          mycontroller: controller.password,
                                          valid: (val) {
                                            return vlidetorinput(
                                                val!, 15, 5, 'name');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ])),
                )
              ])),
    );
  }
}
