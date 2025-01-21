import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_font.dart';

class AppAlerts {
  static ScaffoldFeatureController? showScaffoldDialog(
      BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      margin: const EdgeInsets.all(14.0),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: normalFont(
          16,
          FontWeight.w600,
          AppColors.thickBlue,
        ),
      ),
      duration: const Duration(milliseconds: 1200),
      backgroundColor: Colors.grey.shade300,
    ));
  }
}
