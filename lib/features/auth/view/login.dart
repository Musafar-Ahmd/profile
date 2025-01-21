import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:profile/common/app_alerts.dart';
import 'package:profile/features/auth/view/register.dart';
import 'package:profile/features/profile/view/profile_screen.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_font.dart';
import '../../../common/app_keys.dart';
import '../../../common/custom_buttom.dart';
import '../../../common/custom_decoration.dart';
import '../../../common/navigation.dart';
import '../../../common/storage_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailOrPhone = TextEditingController();
  TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    showItme();
    super.initState();
  }

  showItme() async {
    var box = await StorageManager.instance.openHiveBox();
    var email = box.get(AppKeys.email);
    var password = box.get(AppKeys.password);
    print("object $email");
    print("psa $password");
  }

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
                    "Let’s sign you in",
                    style: normalFont(
                        size * 0.07, FontWeight.w600, AppColors.black),
                  ),
                ),
                SizedBox(
                  height: size * 0.19,
                ),
                Text(
                  "Email or Phone number",
                  style: normalFont(
                      size * 0.05, FontWeight.w500, AppColors.textGrey),
                ),
                TextFormField(
                  controller: _emailOrPhone,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Email or Phone Can't be Empty";
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
                  "Password",
                  style: normalFont(
                      size * 0.05, FontWeight.w500, AppColors.textGrey),
                ),
                TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Password Can't be Empty";
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
                        "Forgot Password?",
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
                  text: "Sign In",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      var box = await StorageManager.instance.openHiveBox();
                      var email = box.get(AppKeys.email);
                      var password = box.get(AppKeys.password);
                      if (email == _emailOrPhone.text &&
                          password == _password.text) {
                        navigate(context: context, screen: ProfileScreen());
                      } else {
                        AppAlerts.showScaffoldDialog(
                            context, "Email or Password is In Correct");
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
                    "Or",
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
                          text: "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Register",
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
