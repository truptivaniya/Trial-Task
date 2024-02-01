import 'package:get/get.dart';

import 'binding/binding.dart';
import 'screens/screen.dart';

final List<GetPage> appPages = [
  GetPage(
      name: SplashScreen.pageId,
      page: () => const SplashScreen(),
      binding: SplashBinding()),
  GetPage(
      name: HomeScreen.pageId,
      page: () => const HomeScreen(),
      binding: HomeBinding()),
  GetPage(
      name: CurrencyDetailScreen.pageId,
      page: () => const CurrencyDetailScreen(),
      binding: CurrencyBinding()),
];
