import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:class_a_ec/core/router/app_routes.dart';
import 'package:class_a_ec/features/onboarding/presentation/widgets/onboarding_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  List<String> onboardingImages = [
    ImagePaths.onboardingBackground1,
    ImagePaths.onboardingBackground2,
    ImagePaths.onboardingBackground3,
  ];
  int currentIndex = 0;
  void incrementCurrentIndex() {
    if (currentIndex == 2) {
      context.pushReplacementNamed(AppRoutes.loginScreen);
      return;
    }
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              onboardingImages[currentIndex],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: OnboardingContainer(
                incrementCurrentIndex: incrementCurrentIndex,
                currentIndex: currentIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
