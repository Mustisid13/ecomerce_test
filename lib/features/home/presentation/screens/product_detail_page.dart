import 'package:ecomerce_test/core/styles/AppColors.dart';
import 'package:ecomerce_test/core/widgets/AppButtonWidget.dart';
import 'package:ecomerce_test/core/widgets/AppImageWidget.dart';
import 'package:ecomerce_test/core/widgets/AppTextWidget.dart';
import 'package:ecomerce_test/features/cart/controller/cart_controller.dart';
import 'package:ecomerce_test/features/cart/presentation/widgets/cart_item_count_widget.dart';
import 'package:ecomerce_test/features/home/controller/product_controller.dart';
import 'package:ecomerce_test/features/home/models/ProductListResponseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rating_bar_flutter/rating_bar_flutter.dart';

class ProductDetailPage extends GetView<ProductController> {
  const ProductDetailPage({super.key});

  ProductDataModel? get data => controller.productDetail;
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
              ()=>AppButtonWidget(
                isLoading: Get.find<CartController>().isLoading.value,
                height: 50,
                onPressed: () {
                  Get.find<CartController>()
                      .addProductToCart(controller.productDetail!, count:controller.productCartCount.value,replaceCount: true);
                },
                btnName: "ADD TO CART",
              ),
            ),
          ),
          20.horizontalSpace,
          CartItemCountWidget(count: controller.productCartCount.value, onCountUpdate: (c){
            controller.productCartCount.value = c;
          }),
          10.horizontalSpace
        ],
      ),
      body: ListView(
        children: [
          ColoredBox(
            color: AppColors.white,
            child: AppImageWidget(
              imageUrl: data?.image,
              height: 400,
            ),
          ),
          30.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextWidget(
                  txtTitle: data?.title,
                  fontSize: 24,
                  maxLine: 2,
                  fontWeight: FontWeight.w600,
                ),
                5.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextWidget(
                      txtTitle: data?.category,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      txtColor: AppColors.grey7c,
                    ),
                    AppTextWidget(
                      txtTitle: "\$ ${data?.price}",
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      txtColor: AppColors.white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    RatingBarFlutter.readOnly(
                      size: 20,
                      isHalfAllowed: true,
                      halfFilledIcon: Icons.star_half,
                      filledColor: AppColors.white,
                      emptyColor: AppColors.grey7c,
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      initialRating: data?.rating?.rate?.toDouble() ?? 0,
                    ),
                    AppTextWidget(
                      txtTitle: "(${data?.rating?.count ?? 0})",
                      fontSize: 12,
                      txtColor: AppColors.grey7c,
                    )
                  ],
                ),
                15.verticalSpace,
                AppTextWidget(
                  txtTitle: data?.description ?? "",
                  fontSize: 14,
                  maxLine: 200,
                  height: 20,
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
                          final data = controller.similarProducts[index];
                          return Container(
                            height: 260.h,
                            width: 180.w,
                            clipBehavior: Clip.antiAlias,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.tileBlack),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ColoredBox(
                                    color: AppColors.white,
                                    child: AppImageWidget(
                                      imageUrl: data.image,
                                      height: 200,
                                      width: double.infinity,
                                    )),
                                10.verticalSpace,
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppTextWidget(
                                          txtTitle: data.title,
                                          fontSize: 16,
                                          maxLine: 2,
                                        ),
                                        Row(
                                          children: [
                                            RatingBarFlutter.readOnly(
                                              size: 15,
                                              isHalfAllowed: true,
                                              halfFilledIcon: Icons.star_half,
                                              filledColor: AppColors.white,
                                              emptyColor: AppColors.grey7c,
                                              filledIcon: Icons.star,
                                              emptyIcon: Icons.star_border,
                                              initialRating: data.rating?.rate
                                                      ?.toDouble() ??
                                                  0,
                                            ),
                                            AppTextWidget(
                                              txtTitle:
                                                  "(${data.rating?.count ?? 0})",
                                              fontSize: 10,
                                              txtColor: AppColors.grey7c,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                10.verticalSpace,
                              ],
                            ),
                          );
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
