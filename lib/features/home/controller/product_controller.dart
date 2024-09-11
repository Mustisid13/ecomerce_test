 import 'package:ecomerce_test/core/routes/route_names.dart';
import 'package:ecomerce_test/core/utils/base_controller.dart';
import 'package:ecomerce_test/features/home/models/ProductListResponseModel.dart';
import 'package:ecomerce_test/features/home/service/product_online_service.dart';
import 'package:get/get.dart';

class ProductController extends BaseController{
  late final ProductOnlineService _productService;
  ProductController({required ProductOnlineService productService}):_productService=productService;
  RxList<ProductDataModel> products = <ProductDataModel>[].obs;
  ProductDataModel? productDetail;
  RxList<ProductDataModel> similarProducts = <ProductDataModel>[].obs;
  RxList<String> categories = <String>[].obs;

  @override
  void onInit() async{
    await Future.wait([fetchCategories(),fetchProducts()]);
    super.onInit();
  }

  // API Calls
  Future<void> fetchProducts()async{
    products.value = await _productService.fetchProducts();
  }

  Future<void> fetchCategories()async{
    categories.value = await _productService.fetchCategories();
  }

  Future<void> fetchCategoryProducts(String category)async{
    similarProducts.value = await _productService.fetchCategoryProducts(category);
  }

  Future<void> fetchProductDetails(int id)async{
    productDetail = await _productService.fetchProductDetails(id);
  }

  void goToDetailsPage(int index) {
    similarProducts.value.clear();
    productDetail = products[index];
    fetchCategoryProducts(productDetail?.category??"");
    similarProducts.removeWhere((item)=>item.id==productDetail?.id);
    Get.toNamed(RouteNames.productDetailPage);
  }


}