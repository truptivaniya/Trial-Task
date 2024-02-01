import 'package:get/get.dart';
import '../model/model.dart';
import 'controller.dart';

class CurrencyDetailController extends BaseController {
  Rx<CurrencyData> argumentData = CurrencyData().obs;

  @override
  void errorHandler(e) {}

  @override
  void onInit() {
    argumentData.value = Get.arguments as CurrencyData;
    super.onInit();
  }
}
