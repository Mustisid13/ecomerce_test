import 'package:ecomerce_test/features/cart/controller/cart_controller.dart';
import 'package:ecomerce_test/features/cart/service/cart_service.dart';
import 'package:get/get.dart';

class CartBinding extends Binding{
  @override
  List<Bind> dependencies() {
    return [
      Bind.put(CartService(localService: Bind.find())),
      Bind.lazyPut(()=>CartController(cartService: Bind.find()))
    ];
  }
}