import 'package:ecomerce_test/features/cart/controller/cart_controller.dart';
import 'package:ecomerce_test/features/home/models/ProductListResponseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/styles/AppColors.dart';
import '../../../../core/widgets/AppImageWidget.dart';
import '../../../../core/widgets/AppTextWidget.dart';
import 'cart_item_count_widget.dart';

class CartProductTile extends StatelessWidget {
  const CartProductTile({super.key,required this.data,required this.onCountUpdate,required this.count, required this.index});
  final ProductDataModel? data;
  final int count;
  final void Function(int count) onCountUpdate;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10.w),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: AppColors.tileBlack,
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredBox(
            color: AppColors.white,
            child: AppImageWidget(
              imageUrl: data?.image,
              width: 90,
              height: 110,
              fit: BoxFit.contain,
            ),
          ),
          15.horizontalSpace,
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppTextWidget(
                        txtTitle: data?.title,
                        maxLine: 2,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        txtColor: AppColors.white,
                      ),
                    ),
                    10.horizontalSpace,
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                      Get.find<CartController>().removeItemFromCart(index);
                    }, icon: const Icon(Icons.delete,color: AppColors.errorColor,))
                  ],
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: CartItemCountWidget(
                        onCountUpdate: (count) {
                            onCountUpdate(count);
                        },
                        count: count,
                      ),
                    ),
                    const Spacer(flex: 3,),
                    AppTextWidget(
                      txtTitle: "\$ ${data?.price}",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      txtColor: AppColors.white,
                    ),
                  ],
                ),
                8.verticalSpace,
              ],
            ),
          )
        ],
      ),
    );
  }
}