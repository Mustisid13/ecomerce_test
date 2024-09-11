import 'package:flutter/material.dart';
import '../styles/AppColors.dart';
import 'AppTextFormWidget.dart';

class PasswordField extends StatefulWidget {
  PasswordField(
      {super.key,
      required this.controller,
      this.validator,
      this.hintText,
      this.onChange});
  TextEditingController controller;
  String? Function(String?)? validator;
  String? hintText;
  dynamic Function(dynamic)? onChange;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      obscureText: !passwordVisible,
      validator: widget.validator,
      controller: widget.controller,
      textCapitalization: TextCapitalization.none,
      onChanged: widget.onChange,
      hintText: widget.hintText ?? "Password*",
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: InkWell(
          onTap: () {
            _changePasswordVisibility();
          },
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: Icon(
                passwordVisible
                    ? Icons.lock_open
                    : Icons.lock,
                color: AppColors.primaryLightColor,
                size: 25,
              ))),
    );
  }

  void _changePasswordVisibility() async{
    passwordVisible = !passwordVisible;
    setState(() {});
    
    if (passwordVisible) {
      await Future.delayed(const Duration(seconds: 3));
      _changePasswordVisibility();
    }
  }
}
