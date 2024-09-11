import 'package:get/get.dart';

class BaseController extends GetxController {
  RxBool isLoading = false.obs;

  void setLoading(){
    isLoading.value = true;
  }
  void stopLoading(){
    isLoading.value = false;
  }
}