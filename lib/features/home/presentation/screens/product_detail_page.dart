import 'package:ecomerce_test/core/styles/AppColors.dart';
import 'package:ecomerce_test/core/widgets/AppButtonWidget.dart';
import 'package:ecomerce_test/core/widgets/AppImageWidget.dart';
import 'package:ecomerce_test/core/widgets/AppTextWidget.dart';
import 'package:ecomerce_test/features/cart/controller/cart_controller.dart';
import 'package:ecomerce_test/features/cart/presentation/widgets/cart_item_count_widget.dart';
import 'package:ecomerce_test/features/home/controller/product_controller.dart';
import 'package:ecomerce_test/features/home/presentation/widgets/similar_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rating_bar_flutter/rating_bar_flutter.dart';

class ProductDetailPage extends GetView<ProductController> {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
              size: 25,
            )),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Obx(
              () => AppButtonWidget(
                isLoading: Get.find<CartController>().isLoading.value,
                height: 50,
                onPressed: () {
                  Get.find<CartController>().addProductToCart(
                      controller.productDetail.value!,
                      count: controller.productCartCount.value,
                      replaceCount: true);
                },
                btnName: "ADD TO CART",
              ),
            ),
          ),
          20.horizontalSpace,
          Obx(
            ()=> CartItemCountWidget(
                count: controller.productCartCount.value,
                onCountUpdate: (c) {
                  controller.productCartCount.value = c;
                }),
          ),
          10.horizontalSpace
        ],
      ),
      body: ListView(
        children: [
          ColoredBox(
            color: AppColors.white,
            child: Obx(
              () => AppImageWidget(
                imageUrl: controller.productDetail.value?.image,
                height: 400,
              ),
            ),
          ),
          30.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => AppTextWidget(
                    txtTitle: controller.productDetail.value?.title,
                    fontSize: 24,
                    maxLine: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                5.verticalSpace,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextWidget(
                        txtTitle: controller.productDetail.value?.category,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        txtColor: AppColors.grey7c,
                      ),
                      AppTextWidget(
                        txtTitle: "\$ ${controller.productDetail.value?.price}",
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        txtColor: AppColors.white,
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Row(
                    children: [
                      RatingBarFlutter.readOnly(
                        size: 20,
                        isHalfAllowed: true,
                        halfFilledIcon: Icons.star_half,
                        filledColor: AppColors.white,
                        emptyColor: AppColors.grey7c,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        initialRating: controller
                                .productDetail.value?.rating?.rate
                                ?.toDouble() ??
                            0,
                      ),
                      AppTextWidget(
                        txtTitle:
                            "(${controller.productDetail.value?.rating?.count ?? 0})",
                        fontSize: 12,
                        txtColor: AppColors.grey7c,
                      )
                    ],
                  ),
                ),
                15.verticalSpace,
                Obx(
                  () => AppTextWidget(
                    txtTitle: controller.productDetail.value?.description ?? "",
                    fontSize: 14,
                    maxLine: 200,
                    height: 20,
                  ),
                ),
                30.verticalSpace,
                const AppTextWidget(
                  txtTitle: "You might like these",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 322,
                  child: Obx(
                    () => ListView.builder(
                        padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.similarProducts.value.length,
                        itemBuilder: (context, index) {
                          return SimilarProductTile(
                              data: controller.similarProducts[index]);
                        }),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
