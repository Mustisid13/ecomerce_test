import 'package:ecomerce_test/core/styles/AppColors.dart';
import 'package:ecomerce_test/core/widgets/AppTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/debouncer.dart';

class CartItemCountWidget extends StatefulWidget {
  const CartItemCountWidget(
      {super.key, required this.count, required this.onCountUpdate});
  final void Function(int count) onCountUpdate;
  final int count;

  @override
  State<CartItemCountWidget> createState() => _CartItemCountWidgetState();
}

class _CartItemCountWidgetState extends State<CartItemCountWidget> {
  int currentCount = 1;

  @override
  void initState() {
    currentCount = widget.count;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CartItemCountWidget oldWidget) {
    if (oldWidget.count != widget.count) {
      currentCount = widget.count;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              currentCount++;
              setState(() {});
              Debouncer().run(() {
                widget.onCountUpdate(currentCount);
              });
              
            },
            child: const _ActionButton(icon: Icons.add)),
        5.horizontalSpace,
        AppTextWidget(
          txtTitle: currentCount.toString(),
          fontSize: 20,
          fontWeight: FontWeight.w500,
          txtColor: AppColors.white,
        ),
        5.horizontalSpace,
        GestureDetector(
            onTap: () {
              if (currentCount == 1) {
                return;
              }
              currentCount--;
              setState(() {});
              Debouncer().run(() {
                widget.onCountUpdate(currentCount);
              });
            },
            child: const _ActionButton(icon: Icons.horizontal_rule_outlined)),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 30.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 8,
              color: AppColors.white.withOpacity(0.2))
        ],
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: AppColors.black,
      ),
    );
  }
}
