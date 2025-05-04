import 'package:easy_debounce/easy_debounce.dart';
import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/core/utils/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomSearchContainer extends StatelessWidget {
  const CustomSearchContainer({super.key, required this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: CustomTextFormField(
        hintText: StringsManager.search,
        prefixIcon: const Icon(Icons.search),
        onChanged: (value) {
          if (onChanged != null && value.isNotEmpty) {
            EasyDebounce.debounce(
              'my-debouncer',
              const Duration(milliseconds: 500),
              () => onChanged!(value),
            );
          }
        },
      ),
    );
  }
}
