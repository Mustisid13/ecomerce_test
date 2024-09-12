import 'package:ecomerce_test/core/styles/AppColors.dart';
import 'package:ecomerce_test/features/home/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductCategoryFilterChips extends GetView<ProductController> {
  const ProductCategoryFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Obx(() => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.value.length,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Obx(
                () => ChoiceChip(
                    showCheckmark: false,
                    selectedColor: AppColors.white,
                    backgroundColor: AppColors.black,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: AppColors.white,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    labelStyle: TextStyle(
                      color: controller.selectedCategoryFilter.value ==
                controller.categories[index] ? AppColors.black : AppColors.white,
                    ),
                    onSelected: (value) {
                      controller
                          .setCategoryFilter(controller.categories[index]);
                    },
                    label: Text(
                      controller.categories[index],
                    ),
                    selected: controller.selectedCategoryFilter.value ==
                controller.categories[index]),
              ),
            );
          })),
    );
  }
}
