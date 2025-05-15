import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../../core/resources/strings_manager.dart';
import '../../../core/utils/custom_text_form_field.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          isEnabled: false,
          controller: TextEditingController(text: 'Mostafa Mahmoud'),
          title: StringsManager.fullName,
        ),
        const Gutter(),
        CustomTextFormField(
          isEnabled: false,
          controller: TextEditingController(text: ' 01012345678'),
          title: StringsManager.mobileNumber,
        ),
        const Gutter(),
        CustomTextFormField(
          isEnabled: false,
          controller: TextEditingController(text: 'Class A Facility'),
          title: StringsManager.facilityName,
        ),
        const Gutter(),
        CustomTextFormField(
          isEnabled: false,
          controller: TextEditingController(text: 'Facility Type'),
          title: StringsManager.facilityType,
        ),
        const Gutter(),
        CustomTextFormField(
          isEnabled: false,
          controller:
              TextEditingController(text: 'Egypt, Cairo, Nasr City, 123456'),
          title: StringsManager.facilityLocationOnMap,
        ),
      ],
    );
  }
}
