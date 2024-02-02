import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../screens/screen.dart';
import '../service/service.dart';
import '../util/util.dart';
import 'controller.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  RxInt currentIndex = 0.obs;
  late TabController tabController =
      TabController(length: 2, vsync: this, initialIndex: 0);

  RxList<CurrencyData> cryptoCurrencyList = <CurrencyData>[].obs;
  RxList<CurrencyData> favouriteList = <CurrencyData>[].obs;
  ScrollController scrollController = ScrollController();
  RxInt pageNo = 1.obs;
  RxInt pageSize = 20.obs;
  RxBool isPaginateData = true.obs;
  RxBool isLoad = false.obs;
  var refreshKey1 = GlobalKey<RefreshIndicatorState>();
  var refreshKey2 = GlobalKey<RefreshIndicatorState>();

  @override
  void errorHandler(e) {}

  @override
  void onInit() {
    getCurrencyData();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (isPaginateData.value) {
          pageNo.value++;
          isLoad.value = true;
          getCurrencyData();
        }
      }
    });
    getFavList();
    super.onInit();
  }

  getFavList() async {
    favouriteList.clear();
    var data = await sharedPreferencesHelper.retrievePrefData('FavList');
    if (data.isNotEmpty) {
      List list = json.decode(data);
      favouriteList.addAll(
          List<CurrencyData>.from(list.map((x) => CurrencyData.fromJson(x))));
    }
    update();
  }

  Future<void> refreshList() async {
    refreshKey1.currentState?.show(
        atTop:
            true); // change atTop to false to show progress indicator at bottom
    await Future.delayed(const Duration(seconds: 2)); //wait here for 2 second
    pageNo.value = 1;
    getCurrencyData(isRefresh: true);
  }

  getCurrencyData({isRefresh = false}) async {
    bool status = await Common.checkInternetConnection();

    if (status) {
      try {
        isPaginateData.value = true;
        var response =
            await RemoteServices.getCurrency(pageNo.value, pageSize.value);
        if (response.statusCode == 200) {
          var jsonData = json.decode(response.body);
          var cryptoCurrencyRes =
              CryptoCurrencyModel.fromJson(jsonData as Map<String, dynamic>);

          if (pageNo.value == 1 || isRefresh) {
            cryptoCurrencyList.clear();
          }

          if (cryptoCurrencyRes.data!.isNotEmpty) {
            cryptoCurrencyList.addAll(cryptoCurrencyRes.data!);
          } else {
            isPaginateData.value = false;
          }
          isLoad.value = false;
        } else {
          isLoad.value = false;
          var data = json.decode(response.body);
          Common.apiErrorSnackBar(
              'Status ${response.statusCode}', data['status']['error_message']);
        }
      } catch (e) {
        Common.errorSnackBar();
        isLoad.value = false;
        isPaginateData.value = false;
      }
    } else {
      isLoad.value = false;
      Common.noInternetSnackBar();
    }
  }

  redirectToDetailPage(CurrencyData data) async{
    var value = await Get.toNamed(CurrencyDetailScreen.pageId, arguments: data);
    if(value != null){
      getFavList();
    }
  }

  @override
  void dispose() {
    super.dispose();
    dispose();
  }
}
