import 'package:ecomerce_test/core/styles/AppColors.dart';
import 'package:ecomerce_test/core/widgets/AppImageWidget.dart';
import 'package:ecomerce_test/core/widgets/AppTextWidget.dart';
import 'package:ecomerce_test/core/widgets/IconContainer.dart';
import 'package:ecomerce_test/features/home/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rating_bar_flutter/rating_bar_flutter.dart';

class HomePage extends GetView<ProductController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 200,
        
        leading:  Padding(
          padding: const EdgeInsets.only(left: 25,top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppTextWidget(
                txtTitle: "Hello,",
                fontSize: 18,
              ),
              5.verticalSpace,
              const AppTextWidget(
                txtTitle: "Mustafa Sid",
                fontSize: 24,
                maxLine: 1,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ),
        actions: const [IconContainer(icon: Icons.shopping_cart)],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Obx(
          () => ListView.builder(
            shrinkWrap: true,
              itemCount: controller.products.value.length,
              itemBuilder: (context, index) {
                final data = controller.products[index];
                return InkWell(
                  onTap: (){
                    controller.goToDetailsPage(index);
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 20.w),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: AppColors.tileBlack,
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                        ColoredBox(
                          color: AppColors.white,
                          child: AppImageWidget(
                            imageUrl: data.image,
                            width: 110,
                            height: 150,
                          ),
                        ),
                        15.horizontalSpace,
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              15.verticalSpace,
                              AppTextWidget(
                                txtTitle: data.title,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                txtColor: AppColors.white,
                              ),
                              10.verticalSpace,
                              AppTextWidget(
                                txtTitle: data.description,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                txtColor: AppColors.white,
                                maxLine: 2,
                              ),
                              10.verticalSpace,
                              Row(
                                children: [
                                  AppTextWidget(
                                    txtTitle: "\$ ${data.price}",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    txtColor: AppColors.white,
                                  ),
                                  const Spacer(),
                                  10.horizontalSpace,

                                  RatingBarFlutter(
                                    size: 20,
                                    isHalfAllowed: true,
                                    halfFilledIcon: Icons.star_half,
                                    filledColor: AppColors.white,
                                    emptyColor: AppColors.grey7c,
                                    onRatingChanged: (_) {},
                                    filledIcon: Icons.star,
                                    emptyIcon: Icons.star_border,
                                    initialRating: data.rating?.rate?.toDouble() ?? 0,
                                  ),
                                  AppTextWidget(
                                    txtTitle: "(${data.rating?.count??0})",
                                    fontSize: 12,
                                    txtColor: AppColors.grey7c,
                                  )
                                ],
                              ),
                              8.verticalSpace,
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
