import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.enabled = true});
  final IconData icon;
  final VoidCallback onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: enabled
              ? ColorsManager.mainColor
              : ColorsManager.mainColor.withAlpha(60),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: ColorsManager.white,
          size: 16,
        ),
      ),
    );
  }
}
