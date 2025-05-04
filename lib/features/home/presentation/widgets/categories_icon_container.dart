import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesIconContainer extends StatelessWidget {
  const CategoriesIconContainer(
      {super.key, required this.iconData, required this.title});

  final IconData iconData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 60,
            decoration: BoxDecoration(
              color: ColorsManager.secondaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.all(
                Radius.circular(30.r),
              ),
            ),
            child: Icon(iconData),
          ),
        ),
        const GutterTiny(),
        Text(title),
      ],
    );
  }
}
