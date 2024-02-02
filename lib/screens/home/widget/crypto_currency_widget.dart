import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constant.dart';
import '../../../controller/controller.dart';

class CryptoCurrencyWidget extends StatelessWidget {
  CryptoCurrencyWidget({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    controller.refreshKey1 = GlobalKey();
    controller.refreshKey2 = GlobalKey();
    return Container(
      color: ColorConfig.colorGrey,
      child: RefreshIndicator(
        key: controller.currentIndex.value == 0
            ? controller.refreshKey1
            : controller.refreshKey2,
        onRefresh: controller.refreshList,
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Obx(() => Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.currentIndex.value == 0
                          ? controller.cryptoCurrencyList.length
                          : controller.favouriteList.length,
                      itemBuilder: (context, int index) {
                        return InkWell(
                          onTap: () {
                            controller.redirectToDetailPage(
                                controller.currentIndex.value == 0
                                    ? controller.cryptoCurrencyList[index]
                                    : controller.favouriteList[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: ColorConfig.colorWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorConfig.colorShadow
                                        .withOpacity(0.25),
                                    offset: const Offset(
                                      0.0,
                                      5.0,
                                    ),
                                    blurRadius: 18.0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "${controller.currentIndex.value == 0 ? controller.cryptoCurrencyList[index].name : controller.favouriteList[index].name}  ${controller.currentIndex.value == 0 ? controller.cryptoCurrencyList[index].symbol : controller.favouriteList[index].symbol}",
                                  style: const TextStyle(
                                      fontFamily: ThemeConstants.mulishMedium),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    getPlaceHolder(),
                    controller.isLoad.value
                        ? const SizedBox(
                            height: 50,
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : Container(),
                    controller.isLoad.value
                        ? const SizedBox(
                            height: 15,
                          )
                        : Container(),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget getPlaceHolder() {
    return controller.currentIndex.value == 0
        ? controller.cryptoCurrencyList.isEmpty
            ? noDataWidget()
            : Container()
        : controller.favouriteList.isEmpty
            ? noDataWidget()
            : Container();
  }

  Widget noDataWidget() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        Strings.strNoData,
        style: TextStyle(
            fontSize: ThemeConstants.textThemeFontSize16,
            fontFamily: ThemeConstants.mulishMedium),
      ),
    );
  }
}
