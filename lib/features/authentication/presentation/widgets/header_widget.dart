import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    this.title,
    this.child,
    this.topPadding,
    this.isBackButtonVisible = false,
    this.titleFontSize,
  });
  final String? title;
  final Widget? child;
  final double? topPadding;
  final bool isBackButtonVisible;
  final double? titleFontSize;

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale == const Locale('ar');
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + (topPadding ?? 10.h)),
          alignment: Alignment.topCenter,
          color: ColorsManager.secondaryColor,
          child: title != null
              ? Text(
                  title!,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: ColorsManager.white,
                        fontSize: titleFontSize,
                      ),
                )
              : child,
        ),
        if (isBackButtonVisible)
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 10.h,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  isArabic ? Icons.arrow_forward_ios : Icons.arrow_back_ios_new,
                  color: ColorsManager.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
