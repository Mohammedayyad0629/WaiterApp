import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/address/addressviewcontroller.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/address/floatbutton.dart';
import '../../widget/address/obxviewaddress.dart';
import '../../widget/address/titlepage.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
      floatingActionButton: const FloatButton(),
      body: GetBuilder<AddressViewController>(
          builder: (controller) => Stack(children: [
                Positioned(
                  top: -120.w,
                  left: 0,
                  child: SvgPicture.asset(
                    ImageAsset.pattern,
                    // color: AppColor.maincolor,
                    // width: double.infinity,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20.h,
                    right: 20.h,
                  ),
                  height: double.infinity,
                  child: Column(children: [
                    const TitlePage(),
                    SizedBox(
                      height: 10.h,
                    ),
                    const ObxViewAddress()
                  ]),
                ),
              ])),
    );
  }
}
