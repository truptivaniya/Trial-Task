import 'package:get/get.dart';
import '../model/model.dart';
import 'controller.dart';

class CurrencyDetailController extends BaseController {
  Rx<CurrencyData> argumentData = CurrencyData().obs;
  final homeController = Get.find<HomeController>();

  @override
  void errorHandler(e) {}

  @override
  void onInit() {
    argumentData.value = Get.arguments as CurrencyData;
    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
    dispose();
  }
}
