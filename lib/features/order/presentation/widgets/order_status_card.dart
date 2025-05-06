import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard(
      {super.key, required this.status, required this.isSelected});
  final String status;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? ColorsManager.mainColor
            : ColorsManager.mainColor.withAlpha(127),
        borderRadius: BorderRadius.circular(38.r),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      alignment: Alignment.center,
      child: Text(
        status,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: isSelected ? ColorsManager.white : ColorsManager.mainColor,
            ),
      ),
    );
  }
}
