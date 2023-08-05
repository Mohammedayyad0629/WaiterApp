import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant/color.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const ButtonCustom({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(96, 0, 0, 0),
              spreadRadius: 0.1,
              blurRadius: 15,
              offset: Offset(0, 0)),
        ], color: AppColor.textcolor, borderRadius: BorderRadius.circular(12)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.cairo(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            height: 1.63,
          ),
        ),
      ),
    );
  }
}
