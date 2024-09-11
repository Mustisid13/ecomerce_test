import 'package:ecomerce_test/core/routes/router.dart';
import 'package:ecomerce_test/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/services/local/local_service.dart';
import 'core/services/network/dio_service.dart';

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
        binds: [
          Bind.put(LocalService()),
          Bind.put(DioService()),
        ],
        initialRoute: AppRoutes.initialRoute,
      ),
    );
  }
}

