import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waiter/routs.dart';
import 'bindings/intialbinding.dart';
import 'core/localization/changedlocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: Translation(),
          debugShowCheckedModeBanner: false,
          locale: controller.language,
          initialBinding: IntialBinding(),
          title: 'Waiter',
          getPages: routes,
          // home: const LogIn(),
          theme: controller.appTheme,
        );
      },
    );
  }
}
