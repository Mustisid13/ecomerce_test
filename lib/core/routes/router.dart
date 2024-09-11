import 'package:get/get.dart';

import '../../features/cart/presentation/screens/cart_page.dart';
import '../../features/home/presentation/screens/home_page.dart';

class AppRoutes {
  static const String initialRoute = '/';

  static final routes = [
    GetPage(
      name: '/',
      page: () => const HomePage(),
    ),
    GetPage(
      name: '/cart',
      page: () => const CartPage(),
    ),
  ];
}
