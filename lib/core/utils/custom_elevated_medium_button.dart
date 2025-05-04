import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/utils/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../global/enums.dart';

class CustomElevatedMediumButton extends StatelessWidget {
  const CustomElevatedMediumButton({
    super.key,
    this.elevatedButtonStyle = CustomElevatedButtonStyle.primary,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
  });
  final CustomElevatedButtonStyle elevatedButtonStyle;
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(207.w, 45.h),
        backgroundColor: backgroundColor ??
            (elevatedButtonStyle == CustomElevatedButtonStyle.primary
                ? ColorsManager.mainColor
                : ColorsManager.white),
        foregroundColor:
            elevatedButtonStyle == CustomElevatedButtonStyle.primary
                ? ColorsManager.white
                : ColorsManager.black,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: ColorsManager.mainColor,
            width: .7,
          ),
          borderRadius: BorderRadius.circular(
            22.r,
          ),
        ),
      ),
      child: isLoading
          ? const CustomLoadingWidget()
          : Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
