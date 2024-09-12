import 'dart:developer';

import 'package:ecomerce_test/core/services/network/dio_service.dart';
import 'package:ecomerce_test/features/home/models/ProductListResponseModel.dart';
import 'package:ecomerce_test/features/home/service/products_offline_service.dart';

class ProductOnlineService {
  late final DioService _dioService;
  late final ProductsOfflineService _productsOfflineService;
  ProductOnlineService(
      {required DioService dioService,
      required ProductsOfflineService productsOfflineService})
      : _dioService = dioService,
        _productsOfflineService = productsOfflineService;

  // Product Methods
  /// fetchCategories() method fetches product list from local if available or else fetches from server
  Future<List<ProductDataModel>> fetchProducts() async {
    try {
      List<ProductDataModel> data = [];
      // fetch from local
      data = await _productsOfflineService.fetchProducts();
      if (data.isEmpty) {
        final result = await _dioService.get("/products");
        if ((result.statusCode ?? 0) < 300) {
          data.addAll((result.data as List<dynamic>)
              .map((e) => ProductDataModel.fromJson(e)));
          await _productsOfflineService.storeProducts(data);
        }
      }
      return data;
    } catch (err) {
      log("", error: err.toString(), name: "fetchProducts()");
      return [];
    }
  }

  Future<List<ProductDataModel>> fetchCategoryProducts(String category) async {
    try {
      List<ProductDataModel> data = [];
      data = await _productsOfflineService.fetchCategoryProducts(category);
      if (data.isEmpty) {
        final result = await _dioService.get("/products/category/$category");
        if ((result.statusCode ?? 0) < 300) {
          data.addAll((result.data as List<dynamic>)
              .map((e) => ProductDataModel.fromJson(e)));
        }
      }
      return data;
    } catch (err) {
      log("", error: err.toString(), name: "fetchProducts()");
      return [];
    }
  }

  // Category Products

  /// fetchCategories() method fetched category list from local if available or else fetches from server
  Future<List<String>> fetchCategories() async {
    try {
      List<String> data = [];
      data = await _productsOfflineService.fetchCategories();
      if (data.isEmpty) {
        final result = await _dioService.get("/products/categories");
        if ((result.statusCode ?? 0) < 300) {
          data = (result.data as List).cast<String>();
          await _productsOfflineService.storeCategory(data);
        }
      }
      return data;
    } catch (err) {
      log("", error: err.toString(), name: "fetchCategories()");
      return [];
    }
  }
}
