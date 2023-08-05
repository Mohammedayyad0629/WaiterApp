// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import '../../../controller/home/homecontroller.dart';

// // ignore: must_be_immutable
// class ButtonNavBar extends GetView<HomeController> {
//   const ButtonNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => PersistentTabView(
//         context,
//         controller: controller.controllernav,
//         screens: controller.buildScreens(),
//         items: controller.navBarsItems(),
//         confineInSafeArea: true,
//         backgroundColor: Colors.white, // Default is Colors.white.
//         handleAndroidBackButtonPress: true, // Default is true.
//         resizeToAvoidBottomInset:
//             true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//         stateManagement: true, // Default is true.
//         hideNavigationBarWhenKeyboardShows:
//             true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//         decoration: NavBarDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           colorBehindNavBar: Colors.white,
//         ),
//         popAllScreensOnTapOfSelectedTab: true,
//         popActionScreens: PopActionScreensType.all,
//         itemAnimationProperties: const ItemAnimationProperties(
//           // Navigation Bar's items animation properties.
//           duration: Duration(milliseconds: 10),
//           curve: Curves.ease,
//         ),
//         screenTransitionAnimation: const ScreenTransitionAnimation(
//           // Screen transition animation on change of selected tab.
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 200),
//         ),
//         navBarStyle:
//             NavBarStyle.style6, // Choose the nav bar style with this property.
//       );
// }
