import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_font.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double borderRadius;
  final FontWeight fontWeight;
  final Color borderColor;

  const CustomButton(
      {Key? key,
        required this.text,
        required this.onTap,
        this.height = 45,
        this.width = double.infinity,
        this.backgroundColor = AppColors.appBlue,
        this.textColor = AppColors.whiteColor,
        this.fontSize = 16,
        this.borderRadius = 14,
        this.borderColor = Colors.transparent,
        this.fontWeight = FontWeight.w400})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            text,
            style: normalFont(
              fontSize,
              fontWeight,
              textColor,
            ),
          ),
        ),
      ),
    );
  }
}
