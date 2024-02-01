import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';

class SplashScreen extends GetView<SplashController> {
  static const pageId = "/Splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorConfig.colorWhite,
          child: Center(
            child: Image.asset(ImagePath.appIcon,height: 150,width: 150,),
          ),
        ),
      ),
    );
  }
}
