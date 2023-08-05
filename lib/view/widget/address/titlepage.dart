import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 80.h),
      child: Padding(
        padding: EdgeInsets.only(left: 8.h),
        child: Text(
          'My Address',
          textAlign: TextAlign.start,
          style: GoogleFonts.cairo(
            fontSize: 18.0,
            color: const Color(0xFF333333),
            fontWeight: FontWeight.w700,
            height: 1.44,
          ),
        ),
      ),
    );
  }
}
