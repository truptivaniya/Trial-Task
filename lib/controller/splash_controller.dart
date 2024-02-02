import 'dart:async';

import 'package:get/get.dart';
import 'package:trial_task/screens/home/home_screen.dart';

import 'controller.dart';

class SplashController extends BaseController {
  @override
  void errorHandler(e) {}

  @override
  void onInit() {
    Timer(const Duration(seconds: 1), goToHome);
    super.onInit();
  }

  void goToHome() async {
    return Get.offAndToNamed(HomeScreen.pageId);
  }

  @override
  void dispose() {
    super.dispose();
    dispose();
  }
}
