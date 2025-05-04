import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SVGIconContainer extends StatelessWidget {
  const SVGIconContainer({super.key, required this.iconPath});

  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 26,
      decoration: const BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        iconPath,
        colorFilter: const ColorFilter.mode(
          ColorsManager.mainColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
