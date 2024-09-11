import 'dart:ui';
import 'package:flutter/material.dart';
import '/core/styles/AppColors.dart';
import '/core/widgets/AppButtonWidget.dart';

class AppDialogBox extends StatelessWidget {
  const AppDialogBox(
      {super.key,
      required this.text,
      required this.onCancel,
      required this.onAction,
      this.actionName,
      this.actionColor});
  final Widget text;
  final void Function() onCancel;
  final void Function() onAction;
  final String? actionName;
  final Color? actionColor;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: Dialog(
        backgroundColor: AppColors.tileBlack,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 10, left: 15, right: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              text,
              // const Gap(15),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButtonWidget(
                    height: 40,
                    width: 100,
                    padding: EdgeInsets.zero,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    onPressed: onCancel,
                    btnColor: AppColors.secondaryColor,
                    btnName: "CANCEL",
                    txtColor: AppColors.tileBlack,
                  ),
// const Gap(15),
                  AppButtonWidget(
                    onPressed: onAction,
                    padding: EdgeInsets.zero,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 40,
                    width: 100,
                    btnColor: AppColors.secondaryColor,
                    btnName: actionName ?? "YES",
                    txtColor: actionColor ?? AppColors.tileBlack,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
