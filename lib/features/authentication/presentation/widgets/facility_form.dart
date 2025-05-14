import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_drop_down_widget.dart';
import '../../../../core/utils/custom_text_form_field.dart';
import 'location_widget.dart';

class FacilityForm extends StatelessWidget {
  const FacilityForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(title: StringsManager.facilityName),
        const Gutter(),
        Text(
          StringsManager.facilityType,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const GutterTiny(),
        CustomDropDownFormField(
          dropDownList: [
            StringsManager.type,
            StringsManager.type,
            StringsManager.type
          ],
        ),
        const Gutter(),
        const LocationWidget(),
        const Gutter(),
      ],
    );
  }
}
