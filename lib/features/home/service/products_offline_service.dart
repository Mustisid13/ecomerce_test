import 'package:ecomerce_test/core/services/local/local_service.dart';
import 'package:ecomerce_test/features/home/models/ProductListResponseModel.dart';
import 'package:ecomerce_test/features/home/service/product_service.dart';

class ProductsOfflineService implements ProductService{
  late final LocalService _localService;
  ProductsOfflineService({required LocalService localService }):_localService= localService;
  @override
  Future<List<String>> fetchCategories() async{
    final data = await _localService.getData("productCategories");
    if(data is List<String>){
      return data;
    }else{
      return [];
    }
  }

  @override
  Future<List<ProductDataModel>> fetchCategoryProducts(String category) async{
    return [];
  }

  @override
  Future<ProductDataModel?> fetchProductDetails(int id) async{
    final products = await fetchProducts();
    return products.firstWhere((e)=>e.id == id);
    
  }

  @override
  Future<List<ProductDataModel>> fetchProducts() async{
    // List of Map
    final data = await _localService.getData("productCategories");
    if(data is List){
      return data.map((e)=>ProductDataModel.fromJson(e)).toList();
    }else{
      return [];
    }
  }

}