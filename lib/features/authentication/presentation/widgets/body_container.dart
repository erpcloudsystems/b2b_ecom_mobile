import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyContainer extends StatelessWidget {
  const BodyContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 680.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 32.w,
        vertical: 32.h,
      ),
      decoration: const BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
