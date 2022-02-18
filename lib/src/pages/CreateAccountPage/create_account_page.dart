import 'package:app_qlorian/src/pages/CreateAccountPage/components/customFormLogin/custom_form.dart';
import 'package:app_qlorian/src/shared/components/customAppBar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '👋 Hello, \n Are you new here?',
        subtitle: ' if you have an account /',
        isIcon: true,
        onPressed: () {},
      ),
      body: const CustomForm(),
    );
  }
}
