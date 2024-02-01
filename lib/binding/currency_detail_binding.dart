import 'package:get/get.dart';
import '../controller/controller.dart';

class CurrencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CurrencyDetailController>(CurrencyDetailController(), permanent: false);
  }
}