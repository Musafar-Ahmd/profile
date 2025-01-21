import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:profile/common/storage_manager.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_font.dart';
import '../../../common/custom_buttom.dart';
import '../../../common/custom_decoration.dart';
import '../../../common/navigation.dart';
import 'login.dart';

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
                    "Let’s sign you up",
                    style: normalFont(
                        size * 0.07, FontWeight.w600, AppColors.black),
                  ),
                ),
                SizedBox(height: size * 0.1),
                _buildLabel("Name", size),
                TextFormField(
                  controller: _name,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Name can't be empty";
                    }
                    return null;
                  },
                  decoration: customInputNoBorder(color: Colors.grey),
                ),
                SizedBox(height: size * 0.05),
                _buildLabel("Email", size),
                TextFormField(
                  controller: _email,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Email can't be empty";
                    }
                    return null;
                  },
                  decoration: customInputNoBorder(color: Colors.grey),
                ),
                SizedBox(height: size * 0.05),
                _buildLabel("Phone Number", size),
                TextFormField(
                  controller: _phone,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Phone can't be empty";
                    }
                    return null;
                  },
                  decoration: customInputNoBorder(color: Colors.grey),
                ),
                SizedBox(height: size * 0.05),
                _buildLabel("Password", size),
                TextFormField(
                  controller: _password,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Password can't be empty";
                    }
                    return null;
                  },
                  decoration: customInputNoBorder(color: Colors.grey),
                ),
                SizedBox(height: size * 0.2),
                CustomButton(
                  text: "Sign Up",
                  fontSize: size * 0.045,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      StorageManager.instance.saveEmail(_email.text);
                      StorageManager.instance.savePassword(_password.text);
                      StorageManager.instance.saveName(_name.text);
                      StorageManager.instance.savePhone(_phone.text);

                      navigate(context: context, screen: SignInScreen());
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
                          text: "Do you have an account? ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Sign In",
                          style: normalFont(
                            15,
                            FontWeight.w400,
                            AppColors.thickBlue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navigate(
                                  context: context, screen: SignUpScreen());
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
