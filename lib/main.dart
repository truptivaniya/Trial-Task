import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trial_task/routes.dart';
import 'package:trial_task/screens/screen.dart';

import 'constant/constant.dart';
import 'service/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      scrollBehavior: const ScrollBehavior(),
      // theme: Themes.light,
      themeMode: ThemeService().theme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.pageId,
      getPages: appPages,
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },);
  }
}