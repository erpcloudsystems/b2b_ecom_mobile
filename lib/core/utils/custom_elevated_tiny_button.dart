import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/utils/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../global/enums.dart';

class CustomElevatedTinyButton extends StatelessWidget {
  const CustomElevatedTinyButton({
    super.key,
    this.elevatedButtonStyle = CustomElevatedButtonStyle.primary,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.minimumSize,
  });
  final CustomElevatedButtonStyle elevatedButtonStyle;
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Size? minimumSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize ?? Size(100.w, 36.h),
        backgroundColor:
            elevatedButtonStyle == CustomElevatedButtonStyle.primary
                ? ColorsManager.mainColor
                : ColorsManager.mainColor.withAlpha(100),
        foregroundColor:
            elevatedButtonStyle == CustomElevatedButtonStyle.primary
                ? ColorsManager.white
                : ColorsManager.mainColor,
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
                fontSize:  15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
