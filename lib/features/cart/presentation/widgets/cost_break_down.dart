import 'package:collection/collection.dart';
import 'package:ecomerce_test/features/cart/controller/cart_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/styles/AppColors.dart';
import '../../../../core/widgets/AppTextWidget.dart';
/// CostBreakDown Widget displays total amount of order with break down of cost
class CostBreakDown extends GetView<CartController> {
  const CostBreakDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
         _TextRow(
          label: "Order:",
          value:"\$ ${controller.cartProducts.map((prod) => (prod.count ?? 1) * (prod.productDataModel?.price ?? 0)).toList().sum.toStringAsFixed(2)}",
        ),
        const _TextRow(
          label: "Delivery:",
          value: "\$ 15",
        ),
        _TextRow(
          label: "Summary:",
          value:
              "\$ ${(controller.cartProducts.map((prod) => (prod.count ?? 1) * (prod.productDataModel?.price ?? 0)).toList().sum + 15).toStringAsFixed(2)}",
        ),
      ],
    );
  }
}

class _TextRow extends StatelessWidget {
  const _TextRow({required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTextWidget(
            txtTitle: label,
            fontSize: 16,
            txtColor: AppColors.grey7c,
          ),
          AppTextWidget(
            txtTitle: value,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
