import 'package:ecomerce_test/core/styles/AppColors.dart';
import 'package:ecomerce_test/core/widgets/AppTextWidget.dart';
import 'package:flutter/material.dart';

class PaymentSelectWidget extends StatefulWidget {
  const PaymentSelectWidget({super.key});

  @override
  _PaymentSelectWidgetState createState() => _PaymentSelectWidgetState();
}

class _PaymentSelectWidgetState extends State<PaymentSelectWidget> {
  int _selectedPayment = 0; // 0 for COD, 1 for Card

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio<int>(
              value: 0,
              fillColor: const WidgetStatePropertyAll(AppColors.white),
              groupValue: _selectedPayment,
              onChanged: (value) {
                setState(() {
                  _selectedPayment = value!;
                });
              },
            ),
            const AppTextWidget(txtTitle: 'Cash on Delivery (COD)'),
          ],
        ),
        Row(
          children: [
            Radio<int>(
              value: 1,
              fillColor: const WidgetStatePropertyAll(AppColors.white),
              groupValue: _selectedPayment,
              onChanged: (value) {
                setState(() {
                  _selectedPayment = value!;
                });
              },
            ),
            const AppTextWidget(txtTitle: 'Card Payment'),
          ],
        ),
      ],
    );
  }
}
