import 'package:flutter/material.dart';
import 'package:profile/features/onboarding/splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorType = EasyLoadingIndicatorType.wave
    ..backgroundColor = Colors.transparent
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..progressColor = Colors.white
    ..maskColor = Colors.transparent
    ..userInteractions = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
