import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../service/service.dart';
import '../util/common.dart';
import 'controller.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  @override
  void errorHandler(e) {}

  @override
  void onInit() {
    getCurrencyData();
    super.onInit();
  }

  RxInt currentIndex = 0.obs;
  late TabController tabController =
      TabController(length: 2, vsync: this, initialIndex: 0);

  RxList<Data> cryptoCurrencyList = <Data>[].obs;
  RxList<Data> favouriteList = <Data>[].obs;

  getCurrencyData() async {
    bool status = await Common.checkInternetConnection();

    if (status) {
      var response = await RemoteServices.getCurrency(1, 100);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var cryptoCurrencyRes =
            CryptoCurrencyModel.fromJson(jsonData as Map<String, dynamic>);

        cryptoCurrencyList.value = cryptoCurrencyRes.data!;
      }
    } else {
      Common.noInternetSnackBar();
    }
  }
}
