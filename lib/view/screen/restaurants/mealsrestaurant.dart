import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:waiter/view/widget/appbarcustom.dart';
import 'package:waiter/view/widget/pattern.dart';
import '../../../controller/restaurants/browserestaurantcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/Restaurant/obxmealsrestaurant.dart';

class MealsRestaurant extends StatelessWidget {
  const MealsRestaurant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<BrowseRestaurantController>();
    return Scaffold(
      body: GetBuilder<BrowseRestaurantController>(
          builder: (controller) => Stack(children: [
                const Patern(color: Colors.grey),
                AppBarCustom(
                  childLeading: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.maincolor,
                  ),
                  onTapLeading: () => Get.back(),
                  title: controller.nameCategory!,
                  isCart: true,
                  actionItemOne: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      ImageAsset.clipboardtick,
                      // color: AppColor.maincolor,
                    ),
                  ),
                  backgroundColor: true,
                ),
                const ObxMealsRestaurant(),
                SizedBox(
                  height: 10.h,
                )
              ])),
    );
  }
}
