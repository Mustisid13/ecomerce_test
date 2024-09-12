import 'dart:convert';

import 'package:ecomerce_test/core/services/local/local_service.dart';
import 'package:ecomerce_test/features/home/models/ProductListResponseModel.dart';

class ProductsOfflineService {
  late final LocalService _localService;
  ProductsOfflineService({required LocalService localService})
      : _localService = localService;

  // Product Methods

  /// storeProducts() method stores products to local storage
  Future<void> storeProducts(List<ProductDataModel> products) async {
    await _localService.storeData("products",
        jsonEncode({"products": products.map((e) => e.toJson()).toList()}));
  }

  /// fetchCategoryProducts() fetches speccific category products
  Future<List<ProductDataModel>> fetchCategoryProducts(String category) async {
    final allProducts = await fetchProducts();
    return allProducts.where((prod) => prod.category == category).toList();
  }

  /// fetchProducts() fetches   products from local storege
  Future<List<ProductDataModel>> fetchProducts() async {
    // List of Map
    final data = await _localService.getData("products");
    if (data != null) {
      final decoded = jsonDecode(data);
      return (decoded["products"] as List)
          .map((e) => ProductDataModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  // Product Category Methods

  /// storeCategory() method stores products to local storage
  Future<void> storeCategory(List<String> data) async {
    await _localService.storeData(
        "categories", jsonEncode({"categories": data}));
  }

  /// fetchCategories() method fetch category list from local storage
  Future<List<String>> fetchCategories() async {
    final data = await _localService.getData("categories");
    if (data != null) {
      final decoded = jsonDecode(data);
      return decoded["categories"].cast<String>();
    } else {
      return [];
    }
  }
}
