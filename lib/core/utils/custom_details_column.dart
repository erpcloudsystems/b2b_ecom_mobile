import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDetailsColumn extends StatelessWidget {
  const CustomDetailsColumn(
      {super.key, required this.label, required this.value, this.icon});
  final String label;
  final String value;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Gutter.custom(
          size: 2,
        ),
        Row(
          children: [
            if (icon != null)
              FaIcon(
                icon,
              ),
            if (icon != null) const Gutter.small(),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        )
      ],
    );
  }
}
