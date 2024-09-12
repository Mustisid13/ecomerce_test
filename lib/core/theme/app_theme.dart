import 'package:flutter/material.dart';

import '../styles/AppColors.dart';

class AppTheme {
  static ThemeData get baseTheme => ThemeData(
        splashColor: Colors.transparent,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: AppColors.primaryColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.scaffoldBg,
          surfaceTintColor: AppColors.scaffoldBg,
        ),
        scaffoldBackgroundColor: AppColors.scaffoldBg,
        useMaterial3: true,
      );
}
