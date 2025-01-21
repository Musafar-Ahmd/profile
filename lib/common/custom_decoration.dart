import 'package:flutter/material.dart';
import 'app_colors.dart';

InputDecoration customInputNoBorder(
    {Icon? suffixIcon,
      Icon? prefixIcon,
      bool isDense = false,
      required Color color,
      String? hintText,
      double? fontSize,
      double? borderRadius}) {
  return InputDecoration(
      hintStyle: TextStyle(color: AppColors.black, fontSize: fontSize),
      hintText: hintText,
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.0),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.0),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.0),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.0),
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      isDense: isDense,
      counterText: "");
}
