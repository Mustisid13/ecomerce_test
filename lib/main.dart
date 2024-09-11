import 'package:ecomerce_test/core/routes/router.dart';
import 'package:ecomerce_test/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        title: 'E-Commerce Demo',
        theme: AppTheme.baseTheme,
        getPages: AppRoutes.routes,
        initialRoute: AppRoutes.initialRoute,
      ),
    );
  }
}

