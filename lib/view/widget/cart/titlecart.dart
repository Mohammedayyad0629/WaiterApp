import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/imageasset.dart';

class TitleCart extends StatelessWidget {
  const TitleCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 80.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: EdgeInsets.only(left: 8.h),
          child: Text(
            'My Cart',
            style: GoogleFonts.cairo(
              fontSize: 18.0.sp,
              color: const Color(0xFF333333),
              fontWeight: FontWeight.w700,
              height: 1.44.h,
            ),
          ),
        ),
        SvgPicture.asset(
          ImageAsset.clipboardtick,
          // color: AppColor.maincolor,
        )
      ]),
    );
  }
}
