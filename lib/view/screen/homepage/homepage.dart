import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/cartcontroller.dart';
import '../../../controller/favorite/favoritecontroller.dart';
import '../../../controller/home/homecontroller.dart';
import '../../../controller/home/homepagecontroller.dart';
import '../../../controller/restaurants/themealcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/appbarcustom.dart';
import '../../widget/home/obxbestmealshome.dart';
import '../../widget/home/obxcategorieshome.dart';
import '../../widget/home/obxofferproductshome.dart';
import '../../widget/home/obxrestaurantshome.dart';
import '../../widget/pattern.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homecontroller = Get.find();
    Get.put(CartController());
    Get.put(FavoriteController());
    Get.put(TheMealController());
    Get.put(HomepageController());
    return Scaffold(
      body: GetBuilder<HomepageController>(
        builder: (controller) => Stack(
          children: [
            const Patern(color: AppColor.maincolor),
            AppBarCustom(
              childLeading: SvgPicture.asset(
                ImageAsset.category,
                // ignore: deprecated_member_use
                color: AppColor.maincolor,
              ),
              onTapLeading: () =>
                  homecontroller.key.currentState?.isDrawerOpen != true
                      ? homecontroller.key.currentState?.openDrawer()
                      : null,
              title: 'Home',
              isCart: true,
              actionItemOne: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  ImageAsset.clipboardtick,
                  // color: AppColor.maincolor,
                ),
              ),
              backgroundColor: false,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 100.h),
              height: double.infinity,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const ObxCategoriesHome(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const ObxBestMealsHome(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const ObxOfferProductsHome(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const ObxRestaurantsHome(),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
