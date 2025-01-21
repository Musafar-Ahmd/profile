import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
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
      _showLoginScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeIn(
              duration: Duration(milliseconds: 1700),
              child: Image.asset(
                "logo_syopi.png",
                height: 156,
                width: 225,
              ),
            )
          ],
        ),
      ),
    );
  }

  // _checkLoginStatus() async {
  //   var box = await StorageManager.instance.openHiveBox();
  //   var token = box.get(AppKeys.token);
  //   if (token == null || token == "") {
  //     _showLoginScreen();
  //   } else {
  //     _showProfileScreen();
  //   }
  // }

  _showProfileScreen() {
    navigate(
        context: context,
        screen: const ProfileScreen(),
        type: NavigationType.pushAndRemoveUntil);
  }

  _showLoginScreen() {
    navigate(
        context: context,
        screen: const SignInScreen(),
        type: NavigationType.pushAndRemoveUntil);
  }
}
