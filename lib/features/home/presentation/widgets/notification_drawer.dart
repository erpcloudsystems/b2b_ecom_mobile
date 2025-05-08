import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';

class NotificationDrawer extends StatelessWidget {
  const NotificationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.secondaryColor.withAlpha(500),
    );
  }
}
