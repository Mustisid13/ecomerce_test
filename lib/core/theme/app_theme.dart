import 'package:flutter/material.dart';

import '../styles/AppColors.dart';

class AppTheme{
  static ThemeData get baseTheme => ThemeData(
            
            scrollbarTheme: const ScrollbarThemeData(
              interactive: true,
              radius: Radius.circular(10),
              thickness: WidgetStatePropertyAll(5),
              trackVisibility: WidgetStatePropertyAll(true),
              thumbVisibility: WidgetStatePropertyAll(true),
              thumbColor: WidgetStatePropertyAll(AppColors.tileBlack),
              trackColor: WidgetStatePropertyAll(AppColors.white)
            ),
            progressIndicatorTheme:
                const ProgressIndicatorThemeData(color: AppColors.primaryColor),
            datePickerTheme: const DatePickerThemeData(
                cancelButtonStyle: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(AppColors.secondaryColor),
                    textStyle: WidgetStatePropertyAll(TextStyle(
                        color: AppColors.errorColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500))),
                confirmButtonStyle: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(AppColors.secondaryColor),
                    textStyle: WidgetStatePropertyAll(TextStyle(
                        color: AppColors.tileBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w500))),
                backgroundColor: AppColors.primaryLightColor,
                todayBorder:
                    BorderSide(color: AppColors.primaryColor, width: 1)),
            appBarTheme: const AppBarTheme(
              
                backgroundColor: AppColors.scaffoldBg,
                surfaceTintColor: AppColors.scaffoldBg,
                
                ),
            fontFamily: "Poppins",
            scaffoldBackgroundColor: AppColors.scaffoldBg,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          );
}