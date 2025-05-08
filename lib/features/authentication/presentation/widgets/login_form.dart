import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/core/utils/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            title: StringsManager.mobileNumber,
          ),
          const Gutter(),
          CustomTextFormField(
            title: StringsManager.password,
            isPassword: true,
          ),
        ],
      ),
    );
  }
}
