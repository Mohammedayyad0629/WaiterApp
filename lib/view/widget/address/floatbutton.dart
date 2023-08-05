import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/nameroutes.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Get.toNamed(
          NameRoutes.addaddress,
        );
      },
      label: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'New Address',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
          SizedBox(
            width: 5.w,
          ),
          Icon(
            Icons.add_location,
            color: Colors.white,
            size: 30.r,
          )
        ],
      ),
    );
  }
}
