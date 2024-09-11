import 'dart:async';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../styles/AppColors.dart';
import '../utils/debouncer.dart';
import 'AppTextFormWidget.dart';
import 'AppTextWidget.dart';

class Phonenumberfield extends HookWidget {
  const Phonenumberfield(
      {super.key,
      required this.controller,
      required this.validator,
      this.showSendOtp = false,
      this.onSendOtp,
      this.enabled = true,
      this.verified = false,
      this.otpButtonLoading = false,
      this.onChanged,
      required this.onCodeChange});
  final TextEditingController controller;
  final String? Function(String) validator;
  final void Function(String) onCodeChange;
  final bool showSendOtp;
  final bool otpButtonLoading;
  final FutureOr<bool> Function()? onSendOtp;
  final void Function(String)? onChanged;
  final bool enabled;
  final bool verified;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> fieldActive = useState(true);
    ValueNotifier<String> code = useState("+91");
    ValueNotifier<bool> valid = useState(false);

    useEffect(() {
      controller.addListener(
        () {
          Debouncer().run(() {
            valid.value = controller.text.length == 10;
          });
        },
      );
      return () {};
    }, []);
    return AppTextFormField(
      enabled: fieldActive.value && enabled,
      maxLength: 10,
      keyboardType: TextInputType.phone,
      controller: controller,
      onChanged: (val) {
        onChanged?.call(val);
      },
      hintText: "Phone Number*",
      prefixIcon: InkWell(
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode:
                  true, // optional. Shows phone code before the country name.
              onSelect: (Country country) {
                code.value = "+${country.phoneCode}";
                onCodeChange(code.value);
              },
            );
          },
          child: Container(
            width: 50,
            margin: const EdgeInsets.only(right: 10, left: 10),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                border:
                    Border(right: BorderSide(color: AppColors.tileBlack))),
            child: AppTextWidget(
              txtTitle: code.value,
              fontSize: 18,
              txtColor: AppColors.primaryColor,
            ),
          )),
    );
  }
}
