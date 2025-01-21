import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: size * 0.18),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Let’s sign you up",
                  style:
                      normalFont(size * 0.07, FontWeight.w600, AppColors.black),
                ),
              ),
              SizedBox(
                height: size * 0.1,
              ),
              Text(
                "Name",
                style: normalFont(
                    size * 0.05, FontWeight.w500, AppColors.textGrey),
              ),
              TextFormField(
                controller: _name,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Name cant be Empty";
                  }
                },
                decoration: customInputNoBorder(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: size * 0.05,
              ),
              Text(
                "Email",
                style: normalFont(
                    size * 0.05, FontWeight.w500, AppColors.textGrey),
              ),
              TextFormField(
                controller: _email,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Email cant be Empty";
                  }
                },
                decoration: customInputNoBorder(color: Colors.grey),
              ),
              SizedBox(
                height: size * 0.05,
              ),
              Text(
                "Phone Number",
                style: normalFont(
                    size * 0.05, FontWeight.w500, AppColors.textGrey),
              ),
              TextFormField(
                controller: _phone,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Phone cant be Empty";
                  }
                },
                decoration: customInputNoBorder(color: Colors.grey),
              ),
              SizedBox(
                height: size * 0.05,
              ),
              Text(
                "Password",
                style: normalFont(
                    size * 0.05, FontWeight.w500, AppColors.textGrey),
              ),
              TextFormField(
                controller: _password,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Password cant be Empty";
                  }
                },
                decoration: customInputNoBorder(color: Colors.grey),
              ),
              SizedBox(
                height: size * 0.20,
              ),
              CustomButton(
                text: "Sign Up",
                fontSize: size * 0.045,
                onTap: () {},
                height: size * 0.11,
                backgroundColor: AppColors.thickBlue,
                borderRadius: 25,
              ),
              SizedBox(
                height: size * 0.1,
              ),
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
                            navigate(context: context, screen: SignInScreen());
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
    );
  }
}
