import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/restaurants/browserestaurantcontroller.dart';
import '../../../controller/restaurants/restaurantscontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/Restaurant/obxbestfoodrestauran.dart';
import '../../widget/Restaurant/obxofferrestaurant.dart';
import '../../widget/Restaurant/obxrestaurantcategorie.dart';
import '../../widget/appbarcustom.dart';
import '../../widget/pattern.dart';

class BrowseMoreRestaurant extends StatelessWidget {
  const BrowseMoreRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantsController restaurantsController = Get.find();
    Get.put(BrowseRestaurantController());
    return Scaffold(
      body: GetBuilder<BrowseRestaurantController>(
          builder: (controller) => Stack(children: [
                const Patern(
                  color: AppColor.maincolor,
                ),
                AppBarCustom(
                  childLeading: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.maincolor,
                  ),
                  onTapLeading: () => Get.back(),
                  title:
                      restaurantsController.restaurantModle.value.data!.name!,
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
                Container(
                    margin:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 100.h),
                    height: double.infinity,
                    child: ListView(scrollDirection: Axis.vertical, children: [
                      const ObxRestaurantCategorie(),
                      SizedBox(
                        height: 10.h,
                      ),
                      const ObxBestFoodRestauran(),
                      SizedBox(
                        height: 10.h,
                      ),
                      const ObxOfferRestaurant()
                    ]))
              ])),
    );
  }
}
