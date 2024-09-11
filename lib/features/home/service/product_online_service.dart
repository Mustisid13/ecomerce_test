import 'dart:developer';

import 'package:ecomerce_test/core/services/network/dio_service.dart';
import 'package:ecomerce_test/features/home/models/ProductListResponseModel.dart';
import 'package:ecomerce_test/features/home/service/product_service.dart';

class ProductOnlineService implements ProductService {
  late final DioService _dioService;
  ProductOnlineService({required DioService dioService}) : _dioService = dioService;

  @override
  Future<List<ProductDataModel>> fetchProducts() async {
    try {
      List<ProductDataModel> data = [];
      final result = await _dioService.get("/products");
      if ((result.statusCode ?? 0) < 300) {
        data.addAll((result.data as List<dynamic>)
            .map((e) => ProductDataModel.fromJson(e)));
      }
      return data;
    } catch (err) {
      log("", error: err.toString(), name: "fetchProducts()");
      return [];
    }
  }

  @override
  Future<ProductDataModel?> fetchProductDetails(int id) async {
    try {
      ProductDataModel? data;
      final result = await _dioService.get("/products/$id");
      if ((result.statusCode ?? 0) < 300) {
        data = ProductDataModel.fromJson(result.data);
      }
      return data;
    } catch (err) {
      log("", error: err.toString(), name: "fetchProductDetails()");
      return null;
    }
  }

  @override
  Future<List<String>> fetchCategories() async {
    try {
      List<String> data = [];
      final result = await _dioService.get("/products/categories");
      if ((result.statusCode ?? 0) < 300) {
        data = (result.data as List).cast<String>();
      }
      return data;
    } catch (err) {
      log("", error: err.toString(), name: "fetchCategories()");
      return [];
    }
  }

  @override
  Future<List<ProductDataModel>> fetchCategoryProducts(String category) async {
    try {
      List<ProductDataModel> data = [];
      final result = await _dioService.get("/products/category/$category");
      if ((result.statusCode ?? 0) < 300) {
        data.addAll((result.data as List<dynamic>)
            .map((e) => ProductDataModel.fromJson(e)));
      }
      return data;
    } catch (err) {
      log("", error: err.toString(), name: "fetchProducts()");
      return [];
    }
  }
}
