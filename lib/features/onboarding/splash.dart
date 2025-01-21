import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:profile/common/app_colors.dart';
import 'package:profile/common/extension.dart';
import 'package:profile/features/auth/view/login.dart';
import 'package:profile/features/profile/view/profile_screen.dart';
import '../../common/app_keys.dart';
import '../../common/navigation.dart';
import '../../common/storage_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      _checkLoginStatus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeIn(
              duration: Duration(milliseconds: 1700),
              child: Image.asset(
                "splash.jpg".imagePath,
                height: 156,
                width: 225,
              ),
            )
          ],
        ),
      ),
    );
  }

  _checkLoginStatus() async {
    var box = await StorageManager.instance.openHiveBox();
    var email = box.get(AppKeys.email);
    if (email == null || email == "") {
      _showLoginScreen();
    } else {
      _showProfileScreen();
    }
  }

  _showProfileScreen() {
    navigate(
        context: context,
        screen:  ProfileScreen(),
        type: NavigationType.pushAndRemoveUntil);
  }

  _showLoginScreen() {
    navigate(
        context: context,
        screen: const SignInScreen(),
        type: NavigationType.pushAndRemoveUntil);
  }
}
