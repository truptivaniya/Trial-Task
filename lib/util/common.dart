import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';

class Common {
  static const String strIsLogin = 'is_login';

  static bool get isAndroid => Platform.isAndroid;

  static bool get isIOS => Platform.isIOS;

  static bool isNull(dynamic item) => item == null;

  static void getSnackBar(String title, String description,
      {int duration = 2, SnackPosition position = SnackPosition.BOTTOM}) {
    Get.snackbar(title, description,
        snackPosition: position, duration: Duration(seconds: duration));
  }

  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  static void errorSnackBar() {
    Get.snackbar(Strings.strError, Strings.strSomethingWentWrong,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorConfig.alertColor,
        colorText: ColorConfig.colorWhite,
        forwardAnimationCurve: Curves.easeOutBack,
        margin: const EdgeInsets.all(15),
        icon: Icon(Icons.close, color: ColorConfig.colorWhite));
  }

  static void successSnackBar(String title) {
    Get.snackbar(Strings.strSuccessful, title,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorConfig.colorGreen,
        colorText: ColorConfig.colorWhite,
        forwardAnimationCurve: Curves.easeOutBack,
        margin: const EdgeInsets.all(15),
        icon: Icon(Icons.check, color: ColorConfig.colorWhite));
  }

  static void apiErrorSnackBar(String? code, String title) {
    Get.snackbar(code ?? Strings.strError, title,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorConfig.alertColor,
        colorText: ColorConfig.colorWhite,
        forwardAnimationCurve: Curves.easeOutBack,
        margin: const EdgeInsets.all(15),
        icon: Icon(Icons.close, color: ColorConfig.colorWhite));
  }

  static void noInternetSnackBar() {
    Get.snackbar(Strings.strError, Strings.strNoInternet,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorConfig.alertColor,
        colorText: ColorConfig.colorWhite,
        forwardAnimationCurve: Curves.easeOutBack,
        margin: const EdgeInsets.all(15),
        icon: Icon(Icons.close, color: ColorConfig.colorWhite));
  }

  static void successSnackBarMessage(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorConfig.colorGreen,
        colorText: ColorConfig.colorWhite,
        forwardAnimationCurve: Curves.easeOutBack,
        margin: const EdgeInsets.all(15),
        icon: Icon(Icons.check, color: ColorConfig.colorWhite));
  }
}
