import 'package:app_qlorian/src/pages/CreateAccountPage/components/controller/controller_text_form_field.dart';
import 'package:app_qlorian/src/pages/profilePage/components/controller/controller_profile_page.dart';
import 'package:app_qlorian/src/shared/components/customTextFormField/custom_text_form_field.dart';
import 'package:app_qlorian/src/shared/components/mask/cpf_mask.dart';
import 'package:app_qlorian/src/shared/components/mask/rg_mask.dart';
import 'package:app_qlorian/src/shared/components/mask/telefone_mask.dart';
import 'package:app_qlorian/src/shared/theme/app_colors.dart';
import 'package:app_qlorian/src/shared/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class CustomFormProfilePage extends StatelessWidget {
  const CustomFormProfilePage({
    Key? key,
    required this.formKey,
    required this.controller,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final ControllerTextFormField controller;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    var controllerProfile = ControllerProfile('França');
    final List<Map<String, dynamic>> itens = [
      {
        'flag': '\u{1F1E6}\u{1F1E9} França',
        'value': 'França',
      },
      {
        'flag': '\u{1F1E7}\u{1F1F7} Brasil',
        'value': 'Brasil',
      },
      {
        'flag': '\u{1F1E7}\u{1F1F4} Bolivia',
        'value': 'Bolivia',
      },
      {
        'flag': '\u{1F1E8}\u{1F1F1} Chile',
        'value': 'Chile',
      },
    ];

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ListView(
        children: [
          Center(
            child: Container(
              height: media.height * 0.15,
              width: media.width * 0.30,
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://avatars.githubusercontent.com/u/62801306?v=4',
                  ),
                ),
              ),
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.photo_camera_rounded,
                    size: 14,
                    color: AppColors.backgroundColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  iconPrefix: Icons.person_outline,
                  title: 'Display name',
                  validator: controller.validateName,
                  keyboardType: TextInputType.text,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Country'),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 56,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryColor.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ValueListenableBuilder<String>(
                    valueListenable: controllerProfile,
                    builder: (context, value, child) {
                      return DropdownButton<String>(
                        borderRadius: BorderRadius.circular(24),
                        value: controllerProfile.value,
                        isExpanded: true,
                        underline: Container(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                        ),
                        onChanged: (newValue) {
                          if (newValue != null) {
                            controllerProfile.dropdownValue(newValue);
                          }
                        },
                        items: itens
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item['value'],
                                child: Text(item['flag']),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  iconPrefix: Icons.person_outline,
                  title: 'CPF',
                  keyboardType: TextInputType.emailAddress,
                  validator: controllerProfile.validateCPF,
                  inputFormatters: [CPFMask()],
                ),
                CustomTextFormField(
                  iconPrefix: Icons.person_outline,
                  title: 'RG',
                  keyboardType: TextInputType.text,
                  validator: controllerProfile.validateRG,
                  inputFormatters: [RGMask()],
                ),
                CustomTextFormField(
                  iconPrefix: Icons.phone_outlined,
                  title: 'PHONE',
                  keyboardType: TextInputType.text,
                  validator: controllerProfile.validateTelefone,
                  inputFormatters: [PhoneMask()],
                ),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState?.validate() == true) {
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
                        'Confirm',
                        style: AppTextTheme.textButton,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
