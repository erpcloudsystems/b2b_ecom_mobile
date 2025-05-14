import 'package:flutter/material.dart';
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
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.network(
            'https://www.classatrading.com/wp-content/uploads/2020/12/%D8%A7%D9%84%D9%85%D9%86%D8%A7%D8%B9%D8%A9-min1.jpg',
            width: 120.w,
            height: 120.h,
          ),
        ),
        Text(title),
      ],
    );
  }
}
