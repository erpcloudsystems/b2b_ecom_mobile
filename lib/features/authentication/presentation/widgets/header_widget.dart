import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, this.title, this.child, this.topPadding});
  final String? title;
  final Widget? child;
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + (topPadding?? 20.h)),
      alignment: Alignment.topCenter,
      color: ColorsManager.secondaryColor,
      child: title != null
          ? Text(
              title!,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: ColorsManager.white,
                  ),
            )
          : child,
    );
  }
}
