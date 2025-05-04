import 'package:class_a_ec/core/extensions/string_extension.dart';
import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:class_a_ec/core/utils/custom_elevated_small_button.dart';
import 'package:class_a_ec/features/onboarding/presentation/widgets/onboarding_container_content.dart';
import 'package:class_a_ec/features/onboarding/presentation/widgets/stepper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingContainer extends StatelessWidget {
  OnboardingContainer({
    super.key,
    required this.incrementCurrentIndex,
    required this.currentIndex,
  });
  final int currentIndex;
  final VoidCallback? incrementCurrentIndex;

  final List<String> onboardingIcons = [
    SVGIconPaths.transferIcon,
    SVGIconPaths.cardIcon,
    SVGIconPaths.deliveryIcon,
  ];

  final List<String> onboardingTitles = [
    'Order for Food'.hardCoded,
    'Easy Payment'.hardCoded,
    'Fast Delivery'.hardCoded,
  ];

  final List<String> onboardingDescriptions = [
    'Lorem ipsum dolor sit amet, conse ctetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.'
        .hardCoded,
    'Lorem ipsum dolor sit amet, conse ctetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.'
        .hardCoded,
    'Lorem ipsum dolor sit amet, conse ctetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.'
        .hardCoded,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 338.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnboardingContainerContent(
            svgImagePath: onboardingIcons[currentIndex],
            title: onboardingTitles[currentIndex],
            description: onboardingDescriptions[currentIndex],
          ),
          const Gutter(),
          StepperWidget(
            currentIndex: currentIndex,
          ),
          const Gutter(),
          CustomElevatedSmallButton(
            title: 'Next'.hardCoded,
            onPressed: incrementCurrentIndex,
          ),
        ],
      ),
    );
  }
}
