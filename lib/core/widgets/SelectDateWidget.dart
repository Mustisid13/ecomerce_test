
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/AppColors.dart';
import 'AppTextWidget.dart';

class SelectDateWidget extends StatefulWidget {
  const SelectDateWidget(
      {super.key,
      this.hintText,
      required this.onChanged,
      this.height,
      this.firstDate,
      this.lastDate,
      this.selectedValue,
      this.showRangePicker = false,
      this.width});
  final String? hintText;
  final Function(DateTime) onChanged;
  final double? height;
  final double? width;
  final DateTime? selectedValue;
  final DateTime? lastDate;
  final DateTime? firstDate;

  final bool showRangePicker;

  @override
  State<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
   DateTime? selectedDate;
   @override
  void initState() {
    selectedDate = widget.selectedValue?? DateTime.now();
    super.initState();

  }

  @override
  void didUpdateWidget(covariant SelectDateWidget oldWidget) {
    selectedDate = widget.selectedValue??DateTime.now();
    super.didUpdateWidget(oldWidget);
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        

        selectedDate = await showDatePicker(
          context: context,
          
          initialDate: widget.selectedValue ?? DateTime.now(),
          firstDate: widget.firstDate ?? DateTime.now().subtract(const Duration(days: 30)),
          lastDate: widget.lastDate ?? DateTime.now(),
        );

        if (selectedDate != null) {
          widget.onChanged(selectedDate!);
        }
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.white),
        child: Row(children: [
          const Icon(
            Icons.calendar_month,
            color: AppColors.primaryColor,
            size: 24,
          ),
          15.horizontalSpace,
          Expanded(
            child: AppTextWidget(
              txtTitle: _getValueToDisplay(selectedDate),
              fontSize: 14,
              fontWeight:
                  selectedDate == null?FontWeight.w400 : FontWeight.w500 ,
              txtColor: selectedDate == null? AppColors.hintText : AppColors.black,
            ),
          ),
          
        ]),
      ),
    );
  }

  _getValueToDisplay(DateTime? selectedValue) {
    if (selectedValue == null) {
      return "Select";
    } else if (DateTime.now().day == selectedValue.day &&
        DateTime.now().year == selectedValue.year &&
        DateTime.now().month == selectedValue.month) {
      return "Today • ${selectedValue.toString().split(" ")[0]}";
    } else {
      return selectedValue.toString().split(" ")[0];
    }
  }
}
