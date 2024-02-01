import 'dart:async';

import 'controller.dart';

class SplashController extends BaseController {
  @override
  void errorHandler(e) {}

  @override
  void onInit() {
    Timer(const Duration(seconds: 1), goToLogin);
    super.onInit();
  }

  void goToLogin() async {
    // return await loadingWrapper(() async {
    //   return Get.offAndToNamed(LoginScreen.pageId);
    // });
  }
}
