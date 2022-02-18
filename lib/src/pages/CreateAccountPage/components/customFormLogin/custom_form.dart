import 'package:app_qlorian/src/pages/CreateAccountPage/components/controller/controller_text_form_field.dart';
import 'package:app_qlorian/src/pages/profilePage/profile_page.dart';
import 'package:app_qlorian/src/shared/components/customTextFormField/custom_text_form_field.dart';
import 'package:app_qlorian/src/shared/components/mask/password_mask.dart';
import 'package:app_qlorian/src/shared/theme/app_colors.dart';
import 'package:app_qlorian/src/shared/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = ControllerTextFormField(false);
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                iconPrefix: Icons.person_outline,
                title: 'Full name',
                validator: controller.validateName,
                keyboardType: TextInputType.text,
              ),
              CustomTextFormField(
                iconPrefix: Icons.mail_outline,
                title: 'E-mail',
                validator: controller.validateEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                iconPrefix: Icons.lock_outline,
                title: 'Password',
                iconSuffix: true,
                validator: controller.validatePassword,
                onChanged: (value) {
                  controller.password = value;
                },
                keyboardType: TextInputType.text,
                inputFormatters: [PasswordMask()],
              ),
              CustomTextFormField(
                iconPrefix: Icons.lock_outline,
                title: 'Confirm password',
                iconSuffix: true,
                validator: controller.validateConfirmPassword,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  controller.confirmPassword = value;
                },
                inputFormatters: [PasswordMask()],
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState?.validate() == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const ProfilePage(),
                      ),
                    );
                    formKey.currentState?.reset();
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: AppTextTheme.textButton,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
