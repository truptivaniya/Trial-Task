import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onCallback;
  final String? title;
  final double width;
  final double? height;

  const CustomButton({
    Key? key,
    this.title,
    this.onCallback,
    this.width = 0.4,
    this.height = 52.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          elevation: 0,
          backgroundColor: ColorConfig.colorBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: ColorConfig.colorBlue),
          ),
        ),
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: ThemeConstants.mulishExtraBold,
              fontSize: ThemeConstants.textThemeFontSize16,
              color: ColorConfig.colorWhite),
        ),
        onPressed: () {},
      ),
    );
  }
}
