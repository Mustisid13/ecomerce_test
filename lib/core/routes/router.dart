import 'package:ecomerce_test/core/routes/route_names.dart';
import 'package:ecomerce_test/features/cart/cart_binding.dart';
import 'package:ecomerce_test/features/cart/presentation/screens/checkout_page.dart';
import 'package:ecomerce_test/features/home/presentation/screens/product_detail_page.dart';
import 'package:get/get.dart';

import '../../features/cart/presentation/screens/cart_page.dart';
import '../../features/home/home_bidings.dart';
import '../../features/home/presentation/screens/home_page.dart';

class AppRoutes {


  static final routes = [

    GetPage(
      name: RouteNames.home,
      
      page: () => const HomePage(),
      bindings: [HomeBidings(),CartBinding()]
    ),
    GetPage(
      name: RouteNames.cart,
      page: () => const CartPage(),
      binding: CartBinding()
      
    ),
    GetPage(
      name: RouteNames.checkOut,
      page: () => const CheckoutPage(),
      binding: CartBinding()
      
    ),
    GetPage(
      name: RouteNames.productDetailPage,
      page: () => const ProductDetailPage(),
      bindings: [HomeBidings(), CartBinding()]
    ),
  ];
}


