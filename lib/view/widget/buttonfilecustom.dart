import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonFileCustom extends StatelessWidget {
  final Function() onTap;
  final String text;
  const ButtonFileCustom({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        alignment: const Alignment(-0.02, 0.04),
        height: 53.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0.r),
          color: const Color(0xFFED771C),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF707070).withOpacity(0.27),
              offset: const Offset(1.0, 1.0),
              blurRadius: 20.0.r,
            ),
          ],
        ),
        child: Text(
          text,
          style: GoogleFonts.cairo(
            fontSize: 16.0.sp,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            height: 1.63.h,
          ),
        ),
      ),
    );
  }
}
