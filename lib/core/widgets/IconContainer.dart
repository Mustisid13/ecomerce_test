import 'package:flutter/material.dart';
import '../styles/AppColors.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({super.key, this.height=40, 
  this.iconSize=20,
  this.iconColor= AppColors.primaryColor,
  required this.icon,  this.bgColor= AppColors.white, this.boxShadow,this.margin});
final double height;
final double iconSize;
final IconData icon;
final Color bgColor;
final List<BoxShadow>? boxShadow;
final EdgeInsets? margin;
final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:margin,
      alignment: Alignment.center,
      height: height,
      width: height,
      decoration: BoxDecoration(shape: BoxShape.circle,color: bgColor,boxShadow:boxShadow ),
      child: Icon(icon,color: iconColor,
      size: iconSize,
      shadows: const [
        
          // BoxShadow(
          //   color: AppColors.black25,
          //   blurStyle: BlurStyle.inner,
          //   offset: Offset(0, 4),
          //   spreadRadius: 0,
          //   blurRadius: 4.0,
          // ),
          BoxShadow(
            color: AppColors.black25,
            offset: Offset(0, 0),
            spreadRadius: 0,
            blurStyle: BlurStyle.inner,
            blurRadius: 4,
          ),
      ],
      ),
    );
  }
}