import 'package:ecomerce_test/core/routes/route_names.dart';
import 'package:ecomerce_test/core/styles/AppColors.dart';
import 'package:ecomerce_test/core/utils/AppAssets.dart';
import 'package:ecomerce_test/core/widgets/AppButtonWidget.dart';
import 'package:ecomerce_test/core/widgets/AppTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<void> showOrderPlacedSuccessfully()async{
  Get.dialog( AlertDialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 5),
    backgroundColor: AppColors.whiteE6,
    content: const AppTextWidget(
      textAlign: TextAlign.center,
      txtTitle: "Order Placed\nSuccessfully!",
      fontSize: 24,
      fontWeight: FontWeight.w600,
      txtColor: AppColors.black,
    ),
    title: LottieBuilder.asset(AppAssets.success,height: 200,frameRate: const FrameRate(500),animate: true,),
    actions: [
      AppButtonWidget(
        btnName: "CONTINUE SHOPPING",
        onPressed: (){
        Get.offAllNamed(RouteNames.home);
      },)
    ],
  ),barrierDismissible: true,).whenComplete((){
    Get.offAllNamed(RouteNames.home);
  });
}