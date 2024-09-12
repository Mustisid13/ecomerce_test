import 'package:collection/collection.dart';
import 'package:ecomerce_test/core/routes/route_names.dart';
import 'package:ecomerce_test/core/styles/AppColors.dart';
import 'package:ecomerce_test/core/utils/AppAssets.dart';
import 'package:ecomerce_test/core/widgets/AppButtonWidget.dart';
import 'package:ecomerce_test/core/widgets/AppTextWidget.dart';
import 'package:ecomerce_test/features/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../widgets/cart_product_tile.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppTextWidget(
          txtTitle: "My Cart",
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Obx(
        ()=> Visibility(
          visible: controller.cartProducts.value.isNotEmpty,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppTextWidget(
                      txtTitle: "Total Amount:",
                      fontSize: 16,
                      txtColor: AppColors.grey7c,
                    ),
                    Obx(
                      () => AppTextWidget(
                        txtTitle:
                            "\$ ${controller.cartProducts.map((prod) => (prod.count ?? 1) * (prod.productDataModel?.price ?? 0)).toList().sum.toStringAsFixed(2)}",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              10.verticalSpace,
              AppButtonWidget(
                height: 50,
                onPressed: () {
                  Get.toNamed(RouteNames.checkOut);
                },
                btnName: "CHECK OUT",
              ),
            ],
          ),
        ),
      ),
      body: Obx((){
        return controller.cartProducts.isNotEmpty
          ?  ListView.builder(
              itemCount: controller.cartProducts.value.length,
              itemBuilder: (context, index) {
                return Obx(
                  ()=>CartProductTile(
                    count: controller.cartProducts[index].count ?? 1,
                    onCountUpdate: (c) {
                      controller.updateCartProductCount(index, c);
                    },
                    data: controller.cartProducts[index].productDataModel,
                    index: index,
                  ),
                );
              })
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  LottieBuilder.asset(AppAssets.emptyCart),10.verticalSpace,
                  const AppTextWidget(txtTitle: "Your cart is empty!",txtColor: AppColors.grey7c,)
                ],
              ),
              );}),
    );
  }
}
