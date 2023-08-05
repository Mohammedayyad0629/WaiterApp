import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/address/addressdetailscontroller.dart';
import '../../../core/functions/validinput.dart';
import '../edittextfildcustom.dart';

class FormDetails extends GetView<AddressDetailsController> {
  const FormDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 20.r,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: Form(
        key: controller.key,
        child: Column(
          children: [
            EditTextFild(
                widget: SvgPicture.string(
                  // frame
                  '<svg viewBox="0.0 0.0 23.0 23.0" ><path transform="translate(7.25, 1.92)" d="M 7.778525829315186 1.878333330154419 C 8.238525390625 2.558750152587891 8.50685977935791 3.373333215713501 8.50685977935791 4.255000114440918 C 8.497276306152344 6.555000305175781 6.686026573181152 8.423749923706055 4.405192852020264 8.50041675567627 C 4.309359550476074 8.490833282470703 4.19435977935791 8.490833282470703 4.088943004608154 8.50041675567627 C 1.971026301383972 8.433332443237305 0.2556097209453583 6.81374979019165 0.02560971863567829 4.743749618530273 C -0.2523069381713867 2.28083324432373 1.769776225090027 0 4.242276191711426 0" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path transform="translate(4.96, 12.64)" d="M 1.739374995231628 6.940729141235352 C 4.374791622161865 8.704061508178711 8.69687557220459 8.704061508178711 11.3322925567627 6.940729141235352 C 13.65145874023438 5.388228893280029 13.65145874023438 2.858229160308838 11.3322925567627 1.315312504768372 C 8.716041564941406 -0.4384374916553497 4.39395809173584 -0.4384374916553497 1.739374995231628 1.315312504768372 C -0.5797916650772095 2.867812633514404 -0.5797916650772095 5.397812366485596 1.739374995231628 6.940729141235352 Z" fill="none" fill-opacity="0.6" stroke="#292d32" stroke-width="1.5" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round" /><path  d="M 23 0 L 23 23 L 0 23 L 0 0 L 23 0 Z" fill="none" fill-opacity="0.0" stroke="none" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                  width: 23.0.w,
                  height: 23.0.h,
                ),
                text: 'Name',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                mycontroller: controller.name,
                valid: (val) {
                  return vlidetorinput(val!, 15, 3, 'name');
                },
                enabled: true),
            Divider(
              thickness: 1,
              height: 2.h,
            ),
            EditTextFild(
                widget: Icon(Icons.my_location),
                text: 'Address Name',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                mycontroller: controller.address,
                valid: (val) {
                  return vlidetorinput(val!, 15, 3, 'name');
                },
                enabled: true),
            Divider(
              thickness: 1,
              height: 2.h,
            ),
            EditTextFild(
              widget: Icon(Icons.phone_android),
              text: 'Mobile',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              mycontroller: controller.mobile,
              valid: (val) {
                return vlidetorinput(val!, 15, 6, 'name');
              },
              enabled: true,
            ),
          ],
        ),
      ),
    );
  }
}
