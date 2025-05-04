import 'package:class_a_ec/core/extensions/string_extension.dart';
import 'package:class_a_ec/core/utils/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            title: 'Full name'.hardCoded,
          ),
          const Gutter(),
          CustomTextFormField(
            title: 'Password'.hardCoded,
            isPassword: true,
          ),
          const Gutter(),
          CustomTextFormField(
            title: 'Email'.hardCoded,
            isEmail: true,
          ),
          const Gutter(),
          CustomTextFormField(
            title: 'Mobile number'.hardCoded,
            isEmail: true,
          ),
          const Gutter(),
          CustomTextFormField(
            title: 'Date of birth'.hardCoded,
            isEmail: true,
          ),
          const Gutter(),
        ],
      ),
    );
  }
}
