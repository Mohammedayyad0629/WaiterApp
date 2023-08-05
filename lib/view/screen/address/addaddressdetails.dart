import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/address/addressdetailscontroller.dart';
import '../../../controller/address/addressviewcontroller.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/address/formdetails.dart';
import '../../widget/buttoncustom.dart';

class AddAddressDetails extends StatelessWidget {
  const AddAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewController addressViewController =
        Get.put(AddressViewController());
    Get.put(AddressDetailsController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: GetBuilder<AddressDetailsController>(builder: (controller) {
        return Stack(children: [
          Positioned(
              top: -120.w,
              left: 0,
              child: SvgPicture.asset(
                ImageAsset.pattern,
                // color: AppColor.maincolor,
                // width: double.infinity,
              )),
          Column(
            children: [
              Expanded(child: Container()),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Please specify your location',
                style: GoogleFonts.cairo(
                  fontSize: 22.0.sp,
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w700,
                  height: 1.18.h,
                ),
                textAlign: TextAlign.center,
              ),
              // Group: Group 506
              SizedBox(height: 20.h),
              const FormDetails(),
              Expanded(child: Container()),
              Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  child: ButtonCustom(
                      text: 'Add Address',
                      onTap: () {
                        controller.addAddress();
                        addressViewController.getMyAddress();
                      })),
            ],
          ),
        ]);
      })),
    );
  }
}
