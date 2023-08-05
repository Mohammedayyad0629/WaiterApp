import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constant/imageasset.dart';

class Patern extends StatelessWidget {
  final Color color;
  const Patern({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -150,
      left: 80,
      child: SvgPicture.asset(
        ImageAsset.pattern,
        color: color,
        width: 350.w,
      ),
    );
  }
}
