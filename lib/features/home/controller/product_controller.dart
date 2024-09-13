import 'package:ecomerce_test/core/routes/route_names.dart';
import 'package:ecomerce_test/core/services/local/local_service.dart';
import 'package:ecomerce_test/core/styles/AppColors.dart';
import 'package:ecomerce_test/core/utils/base_controller.dart';
import 'package:ecomerce_test/core/utils/debouncer.dart';
import 'package:ecomerce_test/core/widgets/AppTextFormWidget.dart';
import 'package:ecomerce_test/core/widgets/AppTextWidget.dart';
import 'package:ecomerce_test/features/cart/controller/cart_controller.dart';
import 'package:ecomerce_test/features/home/models/ProductListResponseModel.dart';
import 'package:ecomerce_test/features/home/service/product_online_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends BaseController {
  late final ProductOnlineService _productService;
  late final CartController _cartController;
  late final LocalService _localService;
  ProductController(
      {required ProductOnlineService productService,
      required LocalService localService,
      required CartController cartController})
      : _productService = productService,
        _localService = localService,
        _cartController = cartController;

  // initially contains all the product, if any filter is applied it changes, if no filter are applied then contains all the products
  RxList<ProductDataModel> filteredProducts = <ProductDataModel>[].obs;

  // array that contains all the products, this array is untouched
  List<ProductDataModel> _allProducts = <ProductDataModel>[];

  Rxn<ProductDataModel> productDetail =
      Rxn(); // selected product to view in detail

  RxInt productCartCount = 1.obs; // detail view product cart count

  // list of products similar to  selected detail  view product
  RxList<ProductDataModel> similarProducts = <ProductDataModel>[].obs;

  RxList<String> categories = <String>[].obs; // list of product categories

  RxnString selectedCategoryFilter =
      RxnString(); // selected category for filter on listing page, initialy null

  late TextEditingController searchController;

  //
  RxBool showSearchClearButton = false.obs;

  // User name for better UI
  RxString userName = "".obs;

  @override
  void onInit() async {
    searchController = TextEditingController();
    searchController.addListener(() {
      Debouncer().run(() {
        _searchProduct();
        if (showSearchClearButton.value || searchController.text.isNotEmpty) {
          showSearchClearButton.value = searchController.text.isNotEmpty;
        }
      });
    });
    await Future.wait([fetchCategories(), fetchProducts()]);
    getUserName();
    super.onInit();
  }

  // API Calls
  Future<void> fetchProducts() async {
    setLoading();
    filteredProducts.value = await _productService.fetchProducts();
    // using sublist() so that _allProducts does not become a reference to filterProducts
    _allProducts = filteredProducts.value.sublist(0);
    stopLoading();
  }

  Future<void> fetchCategories() async {
    categories.value = await _productService.fetchCategories();
  }

  Future<void> fetchCategoryProducts(String category) async {
    similarProducts.value =
        await _productService.fetchCategoryProducts(category);
    similarProducts.removeWhere((item) => item.id == productDetail.value?.id);
  }

  // Navigating function
  void goToDetailsPage({
    required int index,
  }) async {
    // clear similar products
    similarProducts.value.clear();
    // set product to product details
    productDetail.value = filteredProducts[index];

    // fetch similar products
    fetchCategoryProducts(
      productDetail.value?.category ?? "",
    );
    // remove prodyct

    // reset cart count
    productCartCount.value =
        _cartController.getCountOfProduct(productDetail.value?.id);
    Get.toNamed(RouteNames.productDetailPage);
  }

  // switchDetailProduct() used to switch the product in detail view with one of the similar product
  void switchDetailProduct(ProductDataModel product) {
    similarProducts.clear();
    productDetail.value = product;
    fetchCategoryProducts(
      productDetail.value?.category ?? "",
    );
    productCartCount.value =
        _cartController.getCountOfProduct(productDetail.value?.id);
  }

  // Product Filter methods

  Future<void> _filterProductByCategory() async {
    if (selectedCategoryFilter.value == null) {
      return;
    }
    setLoading();
    filteredProducts.value = await _productService
        .fetchCategoryProducts(selectedCategoryFilter.value!);
    _searchProduct();
    stopLoading();
  }

  Future<void> _searchProduct() async {
    setLoading();
    filteredProducts.value = _allProducts.where((element) {
      if (selectedCategoryFilter.value == null) {
        return (element.title?.toLowerCase() ?? "")
            .contains(searchController.text.toLowerCase());
      }
      return (element.title?.toLowerCase() ?? "")
              .contains(searchController.text.toLowerCase()) &&
          element.category == selectedCategoryFilter.value;
    }).toList();
    stopLoading();
  }

  void setCategoryFilter(String cat) {
    if (selectedCategoryFilter.value == cat) {
      selectedCategoryFilter.value = null;
      if (searchController.text.isEmpty) {
        filteredProducts.value = _allProducts;
      } else {
        _searchProduct();
      }
    } else {
      selectedCategoryFilter.value = cat;
      _filterProductByCategory();
    }
  }

  // Get user name
  Future<void> getUserName() async {
    userName.value = await _localService.getData("username") ?? "";
    if (userName.isEmpty) {
      // show dialog to take user name
      await Get.dialog(AlertDialog(
        backgroundColor: AppColors.tileBlack,
        title: const AppTextWidget(
          txtTitle: "What should we call you?",
          fontSize: 16,
        ),
        content: AppTextFormField(
          hintText: "Your good name please",
          onChanged: (val) {
            userName.value = val;
          },
        ),
      )).whenComplete(() async {
        await _localService.storeData("username", userName.value);
      });
    }
  }
}
