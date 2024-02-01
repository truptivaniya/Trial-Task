import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constant.dart';
import '../../../controller/controller.dart';

class CryptoCurrencyWidget extends StatelessWidget {
  CryptoCurrencyWidget({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConfig.colorGrey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.currentIndex.value == 0
                    ? controller.cryptoCurrencyList.length
                    : controller.favouriteList.length,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: ColorConfig.colorWhite,
                        boxShadow: [
                          BoxShadow(
                            color: ColorConfig.colorShadow.withOpacity(0.25),
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
                            "${controller.cryptoCurrencyList[index].name}  ${controller.cryptoCurrencyList[index].symbol}"),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
