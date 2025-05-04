import 'package:class_a_ec/core/global/enums.dart';
import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/utils/custom_model_bottom_sheet.dart';
import 'package:class_a_ec/core/utils/custom_search_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../resources/strings_manager.dart';

class CustomSearchDropDown extends ConsumerWidget {
  const CustomSearchDropDown({
    super.key,
    required this.controller,
    this.isValidate = true,
    this.hint,
    this.prefixIcon,
    this.onChange,
    this.onSearch,
    required this.module,
    this.isClearIcon = false,
  });
  final TextEditingController controller;
  final bool isValidate;
  final IconData? prefixIcon;
  final String? hint;
  final Function(String? value)? onChange;
  final Function(String value)? onSearch;
  final Module module;
  final bool isClearIcon;

  List<String> getList(WidgetRef ref) {
    return [];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (ctx) {
            return SizedBox(
              height: 600,
              child: SingleChildScrollView(
                child: CustomModelBottomSheet(
                  child: Column(
                    children: [
                      CustomSearchContainer(
                        onChanged: (value) {
                          if (onSearch != null) {
                            onSearch!(value);
                          }
                        },
                      ),
                      const Gutter(),
                      Consumer(
                        builder: (context, ref, child) {
                          final list = getList(ref);
                          return ListView.builder(
                            itemCount: list.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: ListTile(
                                  title: Text(list[index]),
                                  contentPadding: const EdgeInsets.all(8),
                                  onTap: () async {
                                    // Close the keyboard forcefully
                                    FocusScopeNode currentFocus =
                                        FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus &&
                                        currentFocus.focusedChild != null) {
                                      currentFocus.focusedChild!.unfocus();
                                    }

                                    // Wait a bit for keyboard to fully dismiss
                                    await Future.delayed(
                                      const Duration(milliseconds: 300),
                                    );

                                    // Now update value and pop the sheet
                                    controller.text = list[index];
                                    onChange!(list[index]);
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: TextFormField(
        controller: controller,
        enabled: false,
        validator: (value) {
          if (isValidate && value!.isEmpty) {
            return StringsManager.emptyValidator;
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: isClearIcon
              ? const Icon(
                  FontAwesomeIcons.xmark,
                  color: ColorsManager.red,
                )
              : null,
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
