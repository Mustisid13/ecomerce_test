import 'package:flutter/material.dart';
import '/core/styles/AppColors.dart';

class AppSwitchButton extends StatefulWidget {
  const AppSwitchButton({super.key, required this.value, required this.onChanged,  this.height=80,  this.width=100, this.activeIcon, this.inActiveIcon, this.inactiveThumbColor,  this.inactiveTrackColor, this.activeThumbColor, this.activeTrackColor});
final bool value;
final Function(bool) onChanged;
final double height;
final double width;
final Icon? activeIcon;
final Icon? inActiveIcon;
final Color? inactiveThumbColor;
final Color? inactiveTrackColor;
final Color? activeThumbColor;
final Color? activeTrackColor;

  @override
  State<AppSwitchButton> createState() => _AppSwitchButtonState();
}

class _AppSwitchButtonState extends State<AppSwitchButton> {
  bool currentValue = false;

  @override
  void initState() {
    currentValue = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppSwitchButton oldWidget) {
    currentValue = widget.value;
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          thumbIcon:  WidgetStatePropertyAll(widget.value?widget.activeIcon:widget.inActiveIcon),
          inactiveTrackColor: widget.inactiveTrackColor??AppColors.whiteE6,
          trackOutlineColor: const WidgetStatePropertyAll(AppColors.transparent),
          trackOutlineWidth: const WidgetStatePropertyAll(0),
          inactiveThumbColor: widget.inactiveThumbColor,
          
          value: currentValue, onChanged: (val){
            currentValue = val;
            widget.onChanged(val);
            setState(() {
              
            });
          },
          activeColor: widget.activeThumbColor?? AppColors.primaryColor,
          activeTrackColor: widget.activeTrackColor?? AppColors.white,),
      ),
    );
  }
}