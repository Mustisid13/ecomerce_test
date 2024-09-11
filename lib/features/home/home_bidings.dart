import 'package:ecomerce_test/features/home/controller/product_controller.dart';
import 'package:ecomerce_test/features/home/service/product_online_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeBidings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.put(ProductOnlineService(dioService: Bind.find())),
      Bind.lazyPut<ProductController>(()=>ProductController(productService: Bind.find())),
    ];
  }
}