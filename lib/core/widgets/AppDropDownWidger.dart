import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'AppTextWidget.dart';

import '../styles/AppColors.dart';

class AppDropDownWidget extends StatelessWidget {
  const AppDropDownWidget(
      {super.key,
      required this.hintText,
      required this.onChanged,
      this.items,
      this.isFilled,
      this.suffixIcon,
      this.suffixWidget,
      this.prefixIcon,
      this.controller,
      this.borderStyle = BorderStyle.solid,
      this.borderWidth = 2,
      this.focusNode,
      this.prefixWidget,
      this.widgetItems,
      this.contentPadding,
      this.selectedValueStyle,
      this.selectedValue});
  final Function(dynamic) onChanged;
  final List<dynamic>? items;
  final EdgeInsets? contentPadding;
  final List<DropdownMenuItem>? widgetItems;
  final String hintText;
  final bool? isFilled;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final double borderWidth;
  final BorderStyle borderStyle;
  final dynamic selectedValue;
  final TextStyle? selectedValueStyle;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      value: selectedValue,
      isExpanded: true,
      hint: AppTextWidget(
          txtTitle: hintText,
          txtColor: AppColors.hintText,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      iconStyleData: IconStyleData(
          icon: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Transform.rotate(
            angle: -1.5707,
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.charcoalBlack,
            )),
      )),
      menuItemStyleData: const MenuItemStyleData(
        overlayColor: WidgetStatePropertyAll(AppColors.white),
      ),
      dropdownStyleData: const DropdownStyleData(
        useSafeArea: true,
        maxHeight: 300
      ),
      style: selectedValueStyle,
      decoration: InputDecoration(
        errorStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        prefixIcon: prefixIcon,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        isDense: true,
        isCollapsed: true,

        suffix: suffixWidget, // previously it was widget.suffixIcon
        suffixIcon: suffixIcon,
        prefix: prefixWidget, // previously it was widget.suffixWidget
        filled: true,
        fillColor: AppColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          gapPadding: 0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          gapPadding: 0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          gapPadding: 0,
        ),
      ),
      items: items != null
          ? items!
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item.toString()),
                  ))
              .toList()
          : widgetItems,
      onChanged: onChanged,
      // dropdownStyleData: DropdownStyleData(
      //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      //   isOverButton: false,
      //   maxHeight: 350,
      // ),

      // buttonHeight: 60.h,
      isDense: true,
    );
  }
}
