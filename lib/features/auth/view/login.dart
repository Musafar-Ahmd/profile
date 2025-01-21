import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:profile/common/app_alerts.dart';
import 'package:profile/common/extension.dart';
import 'package:profile/features/auth/view/register.dart';
import 'package:profile/features/profile/view/profile_screen.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_font.dart';
import '../../../common/app_keys.dart';
import '../../../common/custom_buttom.dart';
import '../../../common/custom_decoration.dart';
import '../../../common/navigation.dart';
import '../../../common/storage_manager.dart';
import '../../../common/app_strings.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: size * 0.2),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    AppStrings.signInTitle,
                    style: normalFont(
                        size * 0.07, FontWeight.w600, AppColors.black),
                  ),
                ),
                SizedBox(
                  height: size * 0.19,
                ),
                Text(
                  AppStrings.emailLabel,
                  style: normalFont(
                      size * 0.05, FontWeight.w500, AppColors.textGrey),
                ),
                TextFormField(
                  controller: _email,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return AppStrings.emailEmptyError;
                    }
                    if (!v.isValidEmail()) {
                      return AppStrings.enterValidEmail;
                    }
                  },
                  decoration: customInputNoBorder(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: size * 0.1,
                ),
                Text(
                  AppStrings.passwordLabel,
                  style: normalFont(
                      size * 0.05, FontWeight.w500, AppColors.textGrey),
                ),
                TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return AppStrings.passwordEmptyError;
                    }
                  },
                  controller: _password,
                  decoration: customInputNoBorder(color: Colors.grey),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        AppStrings.forgotPasswordText,
                        style: normalFont(
                            size * 0.035, FontWeight.w500, AppColors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size * 0.15,
                ),
                CustomButton(
                  text: AppStrings.signInButtonText,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      EasyLoading.show();
                      var box = await StorageManager.instance.openHiveBox();
                      var email = box.get(AppKeys.email);
                      var password = box.get(AppKeys.password);
                      if (email == _email.text && password == _password.text) {
                        EasyLoading.dismiss();
                        AppAlerts.showScaffoldDialog(
                            context, AppStrings.loginSuccessfulMessage);
                        navigate(
                            context: context,
                            screen: ProfileScreen(),
                            type: NavigationType.pushAndRemoveUntil);
                      } else {
                        EasyLoading.dismiss();
                        AppAlerts.showScaffoldDialog(
                            context, AppStrings.incorrectCredentialsMessage);
                      }
                    }
                  },
                  height: size * 0.13,
                  backgroundColor: AppColors.thickBlue,
                  borderRadius: 25,
                ),
                SizedBox(
                  height: size * 0.08,
                ),
                Center(
                  child: Text(
                    AppStrings.orText,
                    style: normalFont(16, FontWeight.w500, AppColors.black),
                  ),
                ),
                SizedBox(
                  height: size * 0.08,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: AppStrings.noAccountText,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        TextSpan(
                          text: AppStrings.registerText,
                          style: normalFont(
                            15,
                            FontWeight.w400,
                            AppColors.thickBlue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navigate(
                                  context: context,
                                  screen: const SignUpScreen());
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
