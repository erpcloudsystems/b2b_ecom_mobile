import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/features/onboarding/presentation/widgets/stepper_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({
    super.key,
    required this.currentIndex,
  });
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StepperItemWidget(
          color:
              currentIndex == 0 ? ColorsManager.mainColor : ColorsManager.grey,
        ),
        const GutterTiny(),
        StepperItemWidget(
          color:
              currentIndex == 1 ? ColorsManager.mainColor : ColorsManager.grey,
        ),
        const GutterTiny(),
        StepperItemWidget(
          color:
              currentIndex == 2 ? ColorsManager.mainColor : ColorsManager.grey,
        ),
      ],
    );
  }
}
