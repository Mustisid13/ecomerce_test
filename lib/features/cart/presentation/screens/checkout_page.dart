import 'package:ecomerce_test/core/styles/AppColors.dart';
import 'package:ecomerce_test/core/widgets/AppButtonWidget.dart';
import 'package:ecomerce_test/features/cart/controller/cart_controller.dart';
import 'package:ecomerce_test/features/cart/presentation/widgets/cost_break_down.dart';
import 'package:ecomerce_test/features/cart/presentation/widgets/order_placed_success_dialog.dart';
import 'package:ecomerce_test/features/cart/presentation/widgets/payment_select_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/AppTextWidget.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

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
      body: ListView(
        padding: EdgeInsets.all(15.r
        ),
        children: [
          const AppTextWidget(
            txtTitle: "Shipping Address",
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          10.verticalSpace,
          Container(
            padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.tileBlack
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppTextWidget(
                  txtTitle: "John Doe",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                10.verticalSpace,
                const AppTextWidget(
                  txtTitle: "3 Newbridge Court\nChino Hills, CA 91709, United States",
                  maxLine: 3,
                )
              ],
            ),
          ),
          20.verticalSpace,
          const AppTextWidget(
            txtTitle: "Select Payment Mode",
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          10.verticalSpace,
          const PaymentSelectWidget()
          
          
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CostBreakDown(),
          AppButtonWidget(onPressed: (){
            Get.find<CartController>().clearCart();
            showOrderPlacedSuccessfully();
          },btnName: "SUBMIT ORDER",),
        ],
      ),
    );
  }
}

