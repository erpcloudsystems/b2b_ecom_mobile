import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key, this.color = Colors.white});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: LoadingIndicator(
          indicatorType: Indicator.ballRotate,
          colors: [ColorsManager.mainColor, ColorsManager.secondaryColor],
          strokeWidth: 2,
        ),
      ),
    );
  }
}
