import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../util/util.dart';
import '../../widgets/widgets.dart';

class CurrencyDetailScreen extends GetView<CurrencyDetailController> {
  static const pageId = "/CurrencyDetail";

  const CurrencyDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.strCurrencyDetails),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: detailView(),
        ),
      ),
    );
  }

  Widget detailView() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: ColorConfig.colorGrey,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${controller.argumentData.value.name} ${controller.argumentData.value.symbol}',
                style: const TextStyle(
                    fontFamily: ThemeConstants.mulishExtraBold,
                    fontSize: ThemeConstants.textThemeFontSize20),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${Strings.strRank} ${controller.argumentData.value.rank}',
                style: const TextStyle(
                    fontFamily: ThemeConstants.mulishRegular,
                    fontSize: ThemeConstants.textThemeFontSize13),
              ),
              spaceBetween(),
              controller.argumentData.value.platform != null
                  ? Text(
                      '${Strings.strPlatform} ${controller.argumentData.value.platform?.name} ${controller.argumentData.value.platform?.symbol}',
                      style: const TextStyle(
                          fontFamily: ThemeConstants.mulishRegular,
                          fontSize: ThemeConstants.textThemeFontSize13),
                    )
                  : const Text(
                      '${Strings.strPlatform} ${Strings.strNotAvailable}',
                      style: TextStyle(
                          fontFamily: ThemeConstants.mulishRegular,
                          fontSize: ThemeConstants.textThemeFontSize13),
                    ),
              spaceBetween(),
              Text(
                '${Strings.strFirstHistoricalData} ${controller.argumentData.value.firstHistoricalData}',
                style: const TextStyle(
                    fontFamily: ThemeConstants.mulishRegular,
                    fontSize: ThemeConstants.textThemeFontSize13),
              ),
              spaceBetween(),
              Text(
                '${Strings.strLastHistoricalData}  ${controller.argumentData.value.firstHistoricalData}',
                style: const TextStyle(
                    fontFamily: ThemeConstants.mulishRegular,
                    fontSize: ThemeConstants.textThemeFontSize13),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: controller.homeController.currentIndex.value == 0
                    ? Strings.strAddToFavourite
                    : Strings.strRemoveFromFavourite,
                onCallback: () {
                  if (controller.homeController.currentIndex.value == 0) {
                    controller.homeController.favouriteList
                        .add(controller.argumentData.value);
                  } else {
                    controller.homeController.favouriteList.removeWhere(
                        (element) =>
                            element.id == controller.argumentData.value.id);
                  }

                  sharedPreferencesHelper.storePrefData(
                      'FavList',
                      controller.homeController.favouriteList.isNotEmpty
                          ? json.encode(controller.homeController.favouriteList)
                          : '');

                  Get.back(
                      result: controller.homeController.currentIndex.value == 1
                          ? true
                          : null);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget spaceBetween() {
    return const SizedBox(
      height: 8,
    );
  }
}
