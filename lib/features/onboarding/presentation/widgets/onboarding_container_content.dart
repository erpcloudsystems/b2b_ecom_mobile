import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingContainerContent extends StatelessWidget {
  const OnboardingContainerContent({
    super.key,
    required this.svgImagePath,
    required this.title,
    required this.description,
  });

  final String svgImagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgImagePath,
          colorFilter: const ColorFilter.mode(
            ColorsManager.mainColor,
            BlendMode.srcIn,
          ),
        ),
        const Gutter(),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorsManager.mainColor,
              ),
        ),
        const Gutter(),
        SizedBox(
          width: 272.w,
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
