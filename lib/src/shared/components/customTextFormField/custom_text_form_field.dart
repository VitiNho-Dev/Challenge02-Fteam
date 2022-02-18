import 'package:app_qlorian/src/pages/CreateAccountPage/components/controller/controller_text_form_field.dart';
import 'package:app_qlorian/src/shared/components/customOutlineInputBorder/custom_outline_input_border.dart';
import 'package:flutter/material.dart';

import 'package:app_qlorian/src/shared/theme/app_colors.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.iconPrefix,
    required this.title,
    this.validator,
    this.iconSuffix = false,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
  }) : super(key: key);

  final IconData? iconPrefix;
  final bool? iconSuffix;
  final String title;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  final controllerTextFormField = ControllerTextFormField(true);
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 24),
        ValueListenableBuilder<bool>(
          valueListenable: controllerTextFormField,
          builder: (context, value, child) {
            return TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              obscureText: iconSuffix! ? value : false,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                enabledBorder: CustomOutlineInputBorder(
                  color: AppColors.primaryColor.withOpacity(0.3),
                ),
                errorBorder: CustomOutlineInputBorder(
                  color: Colors.red.withOpacity(0.3),
                ),
                focusedErrorBorder: CustomOutlineInputBorder(
                  color: Colors.red.withOpacity(0.3),
                ),
                focusedBorder: CustomOutlineInputBorder(
                  color: AppColors.primaryColor.withOpacity(0.3),
                ),
                prefixIcon: Icon(
                  iconPrefix,
                  color: AppColors.primaryColor,
                ),
                suffixIcon: iconSuffix!
                    ? IconButton(
                        onPressed: controllerTextFormField.isValue,
                        icon: value
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined),
                        color: AppColors.subtitleColor,
                      )
                    : null,
              ),
            );
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
