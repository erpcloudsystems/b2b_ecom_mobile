import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyContainer extends StatelessWidget {
  const BodyContainer({super.key, required this.child, this.height = 745});
  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: double.infinity,
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
