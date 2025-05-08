import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_managers.dart';
import '../resources/strings_manager.dart';

class CustomSearchWidget extends StatefulWidget {
  const CustomSearchWidget({
    super.key,
    required this.searchFunction,
  });
  final Function(String value) searchFunction;

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  Timer? debounceTimer;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            spreadRadius: 2,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          // Clear the previous debounce timer
          debounceTimer?.cancel();

          // Set a new debounce timer
          debounceTimer = Timer(const Duration(milliseconds: 1000), () {
            widget.searchFunction(value);
          });
        },
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
        },
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: StringsManager.search,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}
