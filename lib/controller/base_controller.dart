import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import '../util/common.dart';

abstract class BaseController extends GetxController {
  final RxBool _isLoading = false.obs;

  RxBool get isLoading => _isLoading;

  final Connectivity _connectivity = Connectivity();

  Future<void> loadingWrapper(Future<void> Function() function) async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Common.getSnackBar('Error'.tr, 'no_connectivity'.tr);
      return;
    }
    if (_isLoading.value) {
      return;
    }
    try {
      _toggleLoading();
      await function();
    } catch (e) {
      errorHandler(e);
    } finally {
      _toggleLoading();
    }
  }

  void errorHandler(dynamic e);

  void _toggleLoading() {
    _isLoading.value = !_isLoading.value;
  }
}
