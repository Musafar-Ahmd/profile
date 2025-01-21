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


InputDecoration customInputDecoration(
    {Icon? suffixIcon,
      Icon? prefixIcon,
      bool isDense = false,
      required Color color,
      String? hintText,
      String? labelText,
      double? fontSize,
      double? borderRadius}) {
  return InputDecoration(
      labelText: labelText,
      hintStyle: TextStyle(color: AppColors.black, fontSize: fontSize),
      hintText: hintText,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.0),
        borderRadius: BorderRadius.circular(borderRadius ?? 6),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.0),
        borderRadius: BorderRadius.circular(borderRadius ?? 6),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.0),
        borderRadius: BorderRadius.circular(borderRadius ?? 6),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.0),
        borderRadius: BorderRadius.circular(borderRadius ?? 6),
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      isDense: isDense,
      counterText: "");
}