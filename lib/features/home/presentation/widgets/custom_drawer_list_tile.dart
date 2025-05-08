import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_managers.dart';

class CustomDrawerListTile extends StatelessWidget {
  const CustomDrawerListTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.onTap,
  });
  final String title;
  final IconData leadingIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        textColor: ColorsManager.white,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: ColorsManager.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w400),
        ),
        leading: Container(
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          child: Icon(
            leadingIcon,
            size: 22.sp,
            color: ColorsManager.secondaryColor,
          ),
        ),
      ),
    );
  }
}
