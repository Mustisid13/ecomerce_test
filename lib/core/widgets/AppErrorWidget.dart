// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:lottie/lottie.dart';
// import 'package:splitwisely/core/styles/AppColors.dart';
// import 'package:splitwisely/core/utils/AppAssets.dart';
// import 'package:splitwisely/core/widgets/AppButtonWidget.dart';
// import 'package:splitwisely/core/widgets/AppTextWidget.dart';

// class AppErrorWidget extends StatelessWidget {
//   const AppErrorWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(20),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.circular(20),border: Border.all(color: AppColors.errorColor)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//       children: [
//         LottieBuilder.asset(AppAssets.errorLottie),
//         const Gap(10),
//         const AppTextWidget(
//       txtTitle: "Oops! Something went wrong. We apologize for the inconvenience.",
//       fontSize: 14,
//       txtColor: AppColors.charcoalBlack,
//         ),
//         const Gap(20),
//         AppButtonWidget(onPressed: (){
//       // report error to us
//         },
//         height: 40,
//         width: 150,
//         btnColor: AppColors.errorColor,
//         btnName: "Report Error",
//         )
//       ],
//       ),
//     );
//   }
// }