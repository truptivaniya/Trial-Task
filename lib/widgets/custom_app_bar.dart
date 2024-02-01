// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../constant/constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButton;

  final AppBar _appBar = AppBar();

  CustomAppBar({
    Key? key,
    required this.title,
    this.backButton = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: ColorConfig.colorBlack,
            child: Container(
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(178, 195, 204, 0.2),
                      blurRadius: 33,
                      offset: Offset(0, 10),
                    )
                  ],
                  color: Colors.white,
                ),
                child: AppBar(
                  automaticallyImplyLeading: backButton,
                  elevation: 0,
                  title: Text(
                    title,
                    style: TextStyle(
                        color: ColorConfig.colorTitleBlue,
                        fontFamily: ThemeConstants.mulishExtraBold,
                        fontSize: ThemeConstants.textThemeFontSize20),
                  ),
                  centerTitle: true,
                  backgroundColor: ColorConfig.colorWhite,
                ))));
  }

  @override
  Size get preferredSize => Size.fromHeight(_appBar.preferredSize.height);
}
