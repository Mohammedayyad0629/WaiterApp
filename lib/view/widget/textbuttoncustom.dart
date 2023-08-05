import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/color.dart';

class TextButtonCustom extends StatelessWidget {
  final void Function() onPressed;
  final String data;
  const TextButtonCustom(
      {super.key, required this.onPressed, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            data,
            style: TextStyle(fontSize: 13.sp, color: AppColor.textcolor),
          )),
    );
  }
}
