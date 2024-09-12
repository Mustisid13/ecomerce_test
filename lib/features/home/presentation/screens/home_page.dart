import 'package:ecomerce_test/core/routes/route_names.dart';
import 'package:ecomerce_test/core/styles/AppColors.dart';
import 'package:ecomerce_test/core/utils/AppAssets.dart';
import 'package:ecomerce_test/core/widgets/AppTextWidget.dart';
import 'package:ecomerce_test/features/home/controller/product_controller.dart';
import 'package:ecomerce_test/features/home/presentation/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/widgets/AppTextFormWidget.dart';
import '../../../../core/widgets/IconContainer.dart';
import '../widgets/product_category_filter_chips.dart';

class HomePage extends GetView<ProductController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppTextWidget(
                txtTitle: "Hello,",
                fontSize: 18,
              ),
              5.verticalSpace,
              Obx(
                ()=> AppTextWidget(
                  txtTitle: controller.userName.value.isEmpty
                      ? "Guest"
                      : controller.userName.value,
                  fontSize: 24,
                  maxLine: 1,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: AppColors.white,
        onPressed: () {
          Get.toNamed(RouteNames.cart);
        },
        child: const Icon(
          Icons.shopping_cart,
          color: AppColors.primaryColor,
          size: 50,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Column(
          children: [
            AppTextFormField(
              controller: controller.searchController,
              border: const BorderSide(color: AppColors.primaryColor, width: 1),
              hintText: "Search product name",
              suffixIcon: Obx(
                () => Visibility(
                  visible: controller.showSearchClearButton.value,
                  child: GestureDetector(
                      onTap: () {
                        controller.searchController.clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: IconContainer(
                          height: 25,
                          iconSize: 15,
                          bgColor: AppColors.black.withOpacity(0.2),
                          icon: Icons.close,
                        ),
                      )),
                ),
              ),
            ),
            10.verticalSpace,
            const ProductCategoryFilterChips(),
            20.verticalSpace,
            Expanded(
              child: Obx(
                () => controller.isLoading.value
                    ? Center(child: LottieBuilder.asset(AppAssets.loader))
                    : ListView.builder(
                        padding: const EdgeInsets.only(bottom: 100),
                        shrinkWrap: true,
                        itemCount: controller.filteredProducts.value.length,
                        itemBuilder: (context, index) {
                          return ProductTile(
                              data: controller.filteredProducts[index],
                              index: index);
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
