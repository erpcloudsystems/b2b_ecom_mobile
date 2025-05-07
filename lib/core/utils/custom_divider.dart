import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorsManager.mainColor.withAlpha(
        127,
      ),
    );
  }
}
