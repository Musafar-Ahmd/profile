import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:profile/common/extension.dart';
import 'package:profile/common/storage_manager.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_font.dart';
import '../../../common/custom_buttom.dart';
import '../../../common/custom_decoration.dart';
import '../../../common/navigation.dart';
import 'login.dart';
import '../../../common/app_strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: size * 0.18),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    AppStrings.signUpTitle,
                    style: normalFont(
                        size * 0.07, FontWeight.w600, AppColors.black),
                  ),
                ),
                SizedBox(height: size * 0.1),
                _buildLabel(AppStrings.nameLabel, size),
                TextFormField(
                  controller: _name,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return AppStrings.nameEmptyError;
                    }
                    return null;
                  },
                  decoration: customInputNoBorder(color: Colors.grey),
                ),
                SizedBox(height: size * 0.05),
                _buildLabel(AppStrings.emailLabelSignUp, size),
                TextFormField(
                  controller: _email,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return AppStrings.emailEmptyError;
                    }
                    if (!v.isValidEmail()) {
                      return AppStrings.enterValidEmail;
                    }
                    return null;
                  },
                  decoration: customInputNoBorder(color: Colors.grey),
                ),
                SizedBox(height: size * 0.05),
                _buildLabel(AppStrings.phoneLabel, size),
                TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  controller: _phone,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return AppStrings.phoneEmptyError;
                    }
                    return null;
                  },
                  decoration: customInputNoBorder(color: Colors.grey),
                ),
                SizedBox(height: size * 0.05),
                _buildLabel(AppStrings.passwordLabelSignUp, size),
                TextFormField(
                  controller: _password,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return AppStrings.passwordEmptyError;
                    }
                    return null;
                  },
                  decoration: customInputNoBorder(color: Colors.grey),
                ),
                SizedBox(height: size * 0.2),
                CustomButton(
                  text: AppStrings.signUpButtonText,
                  fontSize: size * 0.045,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      EasyLoading.show();
                      StorageManager.instance.saveEmail(_email.text);
                      StorageManager.instance.savePassword(_password.text);
                      StorageManager.instance.saveName(_name.text);
                      StorageManager.instance.savePhone(_phone.text);
                      EasyLoading.dismiss();
                      navigate(context: context, screen: const SignInScreen());
                    }
                  },
                  height: size * 0.11,
                  backgroundColor: AppColors.thickBlue,
                  borderRadius: 25,
                ),
                SizedBox(height: size * 0.1),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: AppStrings.haveAccountText,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        TextSpan(
                          text: AppStrings.signInText,
                          style: normalFont(
                            15,
                            FontWeight.w400,
                            AppColors.thickBlue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navigate(
                                  context: context, screen: const SignInScreen());
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

  Widget _buildLabel(String text, double size) {
    return Text(
      text,
      style: normalFont(size * 0.05, FontWeight.w500, AppColors.textGrey),
    );
  }
}
