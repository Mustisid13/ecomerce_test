import 'dart:convert';

import 'package:ecomerce_test/core/services/local/local_service.dart';
import 'package:ecomerce_test/features/cart/models/user_cart_model.dart';

class CartService {
  late final LocalService _localService;
  CartService({required LocalService localService})
      : _localService = localService;

  // addUpdateCart() method adds a cart is it does not exist and updates the cart
  // if there is already one in the memory
  Future<void> addUpdateCart(List<UserCartProduct> cartProducts) async {
    _localService.storeData(
        "cart", jsonEncode({"cart": cartProducts.map((p) => p.toJson()).toList()}));
  }
  /// fetchCart() method gets the cart from local storage
  Future<List<UserCartProduct>> fetchCart() async {
    final data = await _localService.getData("cart");
    if (data != null && data is String) {
      final cart = jsonDecode(data)["cart"];
      return (cart as List)
          .map((prod) => UserCartProduct.fromJson(prod))
          .toList();
    }
    return [];
  }
}
