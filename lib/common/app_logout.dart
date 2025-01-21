import 'package:flutter/material.dart';
import 'package:profile/common/storage_manager.dart';
import '../features/auth/view/login.dart';
import 'app_alerts.dart';
import 'app_colors.dart';
import 'app_font.dart';
import 'custom_buttom.dart';
import 'navigation.dart';

class AppLogout {
  static Future<void> logout({required context}) async {
    final size = MediaQuery.of(context).size.width;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(),
          backgroundColor: AppColors.whiteColor,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Are you sure want to logout?",
                  textAlign: TextAlign.center,
                  style:
                      normalFont(size * .05, FontWeight.w600, AppColors.black),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  borderRadius: 14,
                  borderColor: AppColors.borderColor,
                  width: 130,
                  text: "Cancel",
                  textColor: AppColors.textGrey,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: AppColors.whiteColor,
                ),
                CustomButton(
                  width: 130,
                  text: "Logout",
                  onTap: () async {
                    await StorageManager.instance.clearData();
                    navigate(
                        context: context,
                        screen: SignInScreen(),
                        type: NavigationType.pushAndRemoveUntil);
                    AppAlerts.showScaffoldDialog(context, "Logout Successfull");
                  },
                  backgroundColor: Color.fromRGBO(184, 70, 70, 1),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
