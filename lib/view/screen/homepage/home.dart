import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waiter/core/constant/color.dart';
import '../../../controller/home/homecontroller.dart';
import 'drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GetBuilder<HomeController>(
          builder: (controller) => WillPopScope(
                onWillPop: () async => controller.doubleExit(),
                child: Scaffold(
                  key: controller.key,

                  drawer: Drawer(
                    width: 220.w,
                    elevation: 100,
                    child: const Draweer(),
                  ),
                  backgroundColor: Colors.white,
                  // bottomNavigationBar: const ButtonNavBar(),
                  bottomNavigationBar: Obx(
                    () => BottomNavigationBar(
                        // showSelectedLabels: false,
                        type: BottomNavigationBarType.shifting,
                        currentIndex: controller.currentIndex.value,
                        onTap: (index) => controller.currentIndex.value = index,
                        selectedLabelStyle:
                            const TextStyle(color: Colors.black),
                        selectedItemColor: AppColor.maincolor,
                        showUnselectedLabels: true,
                        unselectedItemColor: Colors.grey,
                        unselectedFontSize: 10,
                        selectedFontSize: 12,
                        items: [
                          ...List.generate(
                              controller.text.length,
                              (index) => BottomNavigationBarItem(
                                  icon: controller.icon[index],
                                  activeIcon: controller.activeIcon[index],
                                  label: controller.text[index])),
                        ]),
                  ),
                  body: Obx(
                    () => PageTransitionSwitcher(
                      duration: const Duration(milliseconds: 100),
                      transitionBuilder:
                          (child, animation, secondaryAnimation) {
                        return SharedAxisTransition(
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.vertical,
                          child: child,
                        );
                      },
                      child: controller.pages[controller.currentIndex.value],
                    ),
                  ),
                ),
              )),
    );
  }
}
