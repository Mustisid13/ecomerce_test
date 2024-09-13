import 'package:ecomerce_test/core/styles/AppColors.dart';
import 'package:ecomerce_test/core/widgets/AppImageWidget.dart';
import 'package:ecomerce_test/core/widgets/AppTextWidget.dart';
import 'package:ecomerce_test/features/home/controller/product_controller.dart';
import 'package:ecomerce_test/features/home/models/ProductListResponseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rating_bar_flutter/rating_bar_flutter.dart';

class SimilarProductTile extends StatelessWidget {
  const SimilarProductTile({super.key, required this.data});
  final ProductDataModel data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<ProductController>().switchDetailProduct(data);
      },
      child: Container(
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
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          initialRating: data.rating?.rate?.toDouble() ?? 0,
                        ),
                        AppTextWidget(
                          txtTitle: "(${data.rating?.count ?? 0})",
                          fontSize: 10,
                          txtColor: AppColors.grey7c,
                        ),
                        const Spacer(),
                        AppTextWidget(
                          txtTitle: "\$ ${data.price}",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          txtColor: AppColors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
