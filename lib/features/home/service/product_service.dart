import '../models/ProductListResponseModel.dart';

abstract class ProductService{
  Future<List<ProductDataModel>> fetchProducts();

  Future<ProductDataModel?> fetchProductDetails(int id);

  Future<List<String>> fetchCategories();

  Future<List<ProductDataModel>> fetchCategoryProducts(String category);
}