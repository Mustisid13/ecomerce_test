import 'package:ecomerce_test/core/services/local/local_service.dart';
import 'package:ecomerce_test/core/services/network/dio_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GlobalBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.put(LocalService()),
      Bind.put(DioService()),
    ];
  }
}
