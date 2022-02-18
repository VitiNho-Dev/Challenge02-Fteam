import 'package:app_qlorian/src/pages/CreateAccountPage/components/controller/controller_text_form_field.dart';
import 'package:app_qlorian/src/pages/profilePage/components/customFormProfile/custom_form_profile_page.dart';
import 'package:app_qlorian/src/shared/components/customAppBar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = ControllerTextFormField(false);

    return Scaffold(
      appBar: CustomAppBar(
        title: '😎 Setting up your \n profile',
        subtitle: 'Add profile photo',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: CustomFormProfilePage(
        formKey: formKey,
        controller: controller,
      ),
    );
  }
}
