import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.enabled = true,
    this.size,
    this.backGroundColor,
    this.iconColor,
  });
  final IconData icon;
  final VoidCallback onPressed;
  final bool enabled;
  final double? size;
  final Color? backGroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size ?? 26,
        height: size ?? 26,
        decoration: BoxDecoration(
          color: backGroundColor ??
              (enabled
                  ? ColorsManager.mainColor
                  : ColorsManager.mainColor.withAlpha(60)),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor ?? ColorsManager.white,
          size: 16,
        ),
      ),
    );
  }
}
