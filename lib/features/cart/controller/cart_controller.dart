import 'dart:developer';

import 'package:ecomerce_test/core/routes/route_names.dart';
import 'package:ecomerce_test/core/utils/app_toast.dart';
import 'package:ecomerce_test/core/utils/base_controller.dart';
import 'package:ecomerce_test/features/cart/models/user_cart_model.dart';
import 'package:ecomerce_test/features/cart/service/cart_service.dart';
import 'package:ecomerce_test/features/home/models/ProductListResponseModel.dart';
import 'package:get/get.dart';

class CartController extends BaseController {
  late final CartService _cartService;
  CartController({required CartService cartService})
      : _cartService = cartService;

  RxList<UserCartProduct> cartProducts = <UserCartProduct>[].obs;

  @override
  void onInit() async {
    await fetchCart();
    super.onInit();
  }

  Future<void> fetchCart() async {
    try {
      cartProducts.value = await _cartService.fetchCart();
    } catch (err) {
      cartProducts.value = [];
      log("", error: err.toString(), name: "fetchCart()");
    }
  }

  Future<void> addProductToCart(ProductDataModel product,
      {int count = 1, bool replaceCount = false}) async {
    setLoading();
    // check if product exist in cart or not
    final productIndex = cartProducts.value
        .indexWhere((p) => p.productDataModel?.id == product.id);
    // if index is -1 product is not in the cart
    if (productIndex != -1) {
      cartProducts[productIndex] = cartProducts[productIndex].copyWith(
          count: replaceCount
              ? count
              : (cartProducts[productIndex].count ?? 0) + count);
    } else {
      // adding product to cart
      cartProducts
          .add(UserCartProduct(productDataModel: product, count: count));
    }

    await addUpdateCart();
    Get.offAndToNamed(RouteNames.cart);
    stopLoading();
  }

  Future<void> addUpdateCart() async {
    try {
      await _cartService.addUpdateCart(cartProducts);
    } catch (err) {
      showToast(
          title:
              "We are facing some problem in updating your cart, please try again!",
          isError: true);
      log("", error: err.toString(), name: "addUpdateCart()");
    }
  }

  int getCountOfProduct(num? id) {
    // if item is not in the cart we return 1 as it might get add to cart in future
    return cartProducts
            .firstWhere((p) => p.productDataModel?.id == id,
                orElse: () => UserCartProduct(count: 1))
            .count ??
        1;
  }

  Future<void> updateCartProductCount(int index, int count) async {
    cartProducts[index] = cartProducts[index].copyWith(count: count);
    await addUpdateCart();
  }

  Future<void> removeItemFromCart(int index) async {
    cartProducts.removeAt(index);
    await addUpdateCart();
  }

  void clearCart() {
    cartProducts.clear();
    addUpdateCart();
  }
}
