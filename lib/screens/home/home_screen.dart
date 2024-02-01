import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../shimmer/shimmer.dart';
import '../../widgets/widgets.dart';
import 'widget/widget.dart';

class HomeScreen extends GetView<HomeController> {
  static const pageId = "/Home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(title: Strings.strBusinessEntities, backButton: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConfig.colorGrey,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: TabBar(
                    onTap: (index) {
                      controller.currentIndex.value = index;
                    },
                    controller: controller.tabController,
                    indicator: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: ColorConfig.colorBlue,
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: const TextStyle(
                        fontSize: ThemeConstants.textThemeFontSize13,
                        fontFamily: ThemeConstants.mulishBold),
                    labelColor: ColorConfig.colorWhite,
                    unselectedLabelColor: ColorConfig.colorTitleBlue,
                    unselectedLabelStyle: const TextStyle(
                      fontSize: ThemeConstants.textThemeFontSize13,
                      fontFamily: ThemeConstants.mulishMedium,
                    ),
                    tabs: const [
                      Tab(
                        child: Text(
                          Strings.strCurrentCryptocurrencies,
                          style: TextStyle(
                            fontSize: ThemeConstants.textThemeFontSize13,
                            fontFamily: ThemeConstants.mulishMedium,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          Strings.strFavourites,
                          style: TextStyle(
                            fontSize: ThemeConstants.textThemeFontSize13,
                            fontFamily: ThemeConstants.mulishMedium,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Obx(() => controller.cryptoCurrencyList.isNotEmpty ? Flexible(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.tabController,
                  children: [
                    // Current Crypto Currency widget
                    CryptoCurrencyWidget(),
                    // Favourites
                    CryptoCurrencyWidget()
                  ],
                ),
              ) : Flexible(child: currencyShimmer())),
            ],
          ),
        ),
      ),
    );
  }
}
