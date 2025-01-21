import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:profile/common/app_alerts.dart';
import 'package:profile/common/app_logout.dart';
import 'package:profile/common/extension.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_font.dart';
import '../../../common/app_keys.dart';
import '../../../common/custom_buttom.dart';
import '../../../common/custom_decoration.dart';
import '../../../common/storage_manager.dart';
import '../../../common/app_strings.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() async {
    var box = await StorageManager.instance.openHiveBox();
    _name.text = box.get(AppKeys.name);
    _email.text = box.get(AppKeys.email);
    _phone.text = box.get(AppKeys.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: commonAppBar(AppStrings.myAccount),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      AppStrings.profilePicture.imagePath,
                      height: 110,
                      width: 110,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isEditing = !_isEditing;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.appBlue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        _isEditing ? AppStrings.cancel : AppStrings.editProfile,
                        style: normalFont(
                          12,
                          FontWeight.w400,
                          AppColors.appBlue,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                _buildTextFormField(
                    AppStrings.name, controller: _name, _isEditing),
                const SizedBox(height: 22),
                _buildTextFormField(
                    AppStrings.email, controller: _email, _isEditing),
                const SizedBox(height: 22),
                _buildTextFormField(
                    AppStrings.phone,
                    controller: _phone,
                    _isEditing,
                    isPhone: true),
                const SizedBox(height: 22),
                if (_isEditing) const SizedBox(height: 20),
                if (_isEditing)
                  CustomButton(
                      text: AppStrings.saveChanges,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          EasyLoading.show();
                          StorageManager.instance.saveName(_name.text);
                          StorageManager.instance.savePhone(_phone.text);
                          StorageManager.instance.saveEmail(_email.text);
                          EasyLoading.dismiss();
                          AppAlerts.showScaffoldDialog(
                              context, AppStrings.profileUpdated);
                        }
                      }),
                const SizedBox(height: 100),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      AppLogout.logout(context: context);
                    },
                    child: Image.asset(
                      AppStrings.logoutImage.imagePath,
                      height: 65,
                      width: 65,
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

  Widget _buildTextFormField(String label, bool isEditing,
      {bool isDisabled = false,
      required TextEditingController controller,
      bool isPhone = false}) {
    return TextFormField(
      inputFormatters: [
        isPhone
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter
      ],
      keyboardType: isPhone ? TextInputType.number : TextInputType.text,
      maxLength: isPhone ? 10 : 100,
      onTapOutside: (event) => FocusScope.of(context).requestFocus(FocusNode()),
      controller: controller,
      enabled: isEditing && !isDisabled,
      decoration: customInputDecoration(
        color: const Color.fromRGBO(124, 124, 124, 1),
      ).copyWith(labelText: label),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$label cannot be empty";
        }
        return null;
      },
    );
  }

  AppBar commonAppBar(String title) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.whiteColor,
      title: Text(
        title,
        style: normalFont(18, FontWeight.w500, Colors.black),
      ),
    );
  }
}
